//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include "SQLITE3CLASS.h"
#include "UnitDlgAddEditTask.h"
#include "CaldoTask.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "NxCustomGrid"
#pragma link "NxCustomGridControl"
#pragma link "NxGrid"
#pragma link "NxScrollControl"
#pragma link "NxCollection"
#pragma link "NxColumnClasses"
#pragma link "NxColumns"
#pragma link "CoolTrayIcon"
#pragma link "TextTrayIcon"
#pragma resource "*.dfm"
TForm1 *Form1;

#include <vector>
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
void TForm1::init_database()
{
   SQLITE3 sqlite("caldo.db");
   sqlite.exe(  "CREATE TABLE todos (id INTEGER PRIMARY KEY, "
                "date_added TEXT, memo TEXT, date_completed TEXT, "
                "date_due TEXT, "
                "recurring_unit TEXT, recurring_every_x TEXT);"

                "CREATE TABLE completed_recurring_todos "
                "(id INTEGER PRIMARY KEY, todo_id NUMERIC, date_completed TEXT);");
}
//---------------------------------------------------------------------------
void __fastcall TForm1::calClick(TObject *Sender)
{
  btnDeleteTask->Visible = false;
  vctCurTasks.clear();
  DateSeparator = '-';
  TimeSeparator = ':';
  ShortDateFormat = "yyyy-mm-dd";
  ShortTimeFormat = "hh:nn:ss";

   nsSQLITE3::quick_results qr;
   nxg->ClearRows();
   SQLITE3 sqlite("caldo.db");
   AnsiString sql = "SELECT * FROM todos "
                     "WHERE date_completed = '0' "
                     "  AND (date_due IS NULL OR date_due LIKE '" + FormatDateTime("yyyy\"-\"mm\"-\"dd", cal->Date) + "%')";
   sqlite.quick_exe(sql.c_str(), qr);
   if (qr.result == 0 || qr.rc != SQLITE_OK){
      init_database();
      qr.free();
      return;
   }
   if (qr.ncol == 0){ return; }
   memo->Clear();
   nxg->BeginUpdate();
   nxg->AddRow(qr.nrow);
   String col;
   for (int r = 0; r <= qr.nrow; ++r){
         vctCurTasks.push_back();
         int ct_i = vctCurTasks.size()-1;

      for (int c = 0; c < qr.ncol; ++c){
         if (r == 0){ continue; }
         char* cur = qr.result[ SQLITE3::calc_absolute_index(r, c, qr.ncol) ];
         String s_cur = cur;

         //grab column from first row
         col = qr.result[ SQLITE3::calc_absolute_index(0, c, qr.ncol) ];

         if (col == "id"){
            int id = StrToInt(cur);
            nxg->Row[r-1]->Data = (void*)ct_i;
            vctCurTasks[ct_i].id = StrToInt(cur);
         }else if (col == "date_completed"){
            nxg->Cell[0][r-1]->AsBoolean = (s_cur != "0");
            vctCurTasks[ct_i].date_completed = s_cur;
         }else if (col == "memo"){
            nxg->Cells[1][r-1] = cur;
            vctCurTasks[ct_i].memo = s_cur;
         }else if (col == "date_due"){
            //String workabledate = StringReplace(cur, "-", "/", TReplaceFlags() << rfReplaceAll)
            vctCurTasks[ct_i].date_completed = s_cur;

            String date = s_cur.SubString(1, s_cur.Pos(" ")-1);
            String time = s_cur.SubString(s_cur.Pos(" ")+1, s_cur.Length());

            nxg->Cell[2][r-1]->AsDateTime = StrToDate(date);
            nxg->Cell[3][r-1]->AsDateTime = StrToTime(time);
         }else if (col == "recurring_unit"){
            vctCurTasks[ct_i].recurring_unit = s_cur;
         }else if (col == "recurring_every_x"){
            vctCurTasks[ct_i].recurring_every_x = s_cur;
         }
      }//foreach column
   }//foreach row
   qr.free();
   nxg->EndUpdate();
   tray->Text = IntToStr(nxg->RowCount);


   sql = "SELECT * FROM todos "
          "WHERE date_completed = '0' "
          "AND recurring_unit = 'month' "
          "AND recurring_every_x = '" +FormatDateTime("d", cal->Date) + "'";

   sqlite.quick_exe(sql.c_str(), qr);
   if (qr.result == 0 || qr.rc != SQLITE_OK){
      init_database();
      qr.free();
      return;
   }
   if (qr.ncol == 0){ return; }

   nxg->BeginUpdate();
   nxg->AddRow(qr.nrow);
   for (int r = 0; r < qr.nrow; ++r){
         vctCurTasks.push_back();
         int ct_i = vctCurTasks.size()-1;

      for (int c = 0; c < qr.ncol; ++c){
         if (r == 0){ continue; }
         char* cur = qr.result[ SQLITE3::calc_absolute_index(r, c, qr.ncol) ];
         String s_cur = cur;

         //grab column from first row
         col = qr.result[ SQLITE3::calc_absolute_index(0, c, qr.ncol) ];

         if (col == "id"){
            int id = StrToInt(cur);
            nxg->Row[r-1]->Data = (void*)ct_i;
            vctCurTasks[ct_i].id = StrToInt(cur);
         }else if (col == "date_completed"){
            nxg->Cell[0][r-1]->AsBoolean = (s_cur != "0");
            vctCurTasks[ct_i].date_completed = s_cur;
         }else if (col == "memo"){
            nxg->Cells[1][r-1] = cur;
            vctCurTasks[ct_i].memo = s_cur;
         }else if (col == "date_due"){
            //String workabledate = StringReplace(cur, "-", "/", TReplaceFlags() << rfReplaceAll)
            vctCurTasks[ct_i].date_completed = s_cur;

            String date = s_cur.SubString(1, s_cur.Pos(" ")-1);
            String time = s_cur.SubString(s_cur.Pos(" ")+1, s_cur.Length());

            try{
               nxg->Cell[2][r-1]->AsDateTime = StrToDate(date);
               nxg->Cell[3][r-1]->AsDateTime = StrToTime(time);
            }catch(EConvertError& er){
               nxg->Cell[2][r-1]->AsString = "Never";
               nxg->Cell[3][r-1]->AsString = "";
            }catch(Exception& ex){
               nxg->Cell[2][r-1]->AsString = "Never";
               nxg->Cell[3][r-1]->AsString = "";
            }catch(...){
               nxg->Cell[2][r-1]->AsString = "Never";
               nxg->Cell[3][r-1]->AsString = "";
            }
         }else if (col == "recurring_unit"){
            vctCurTasks[ct_i].recurring_unit = s_cur;
         }else if (col == "recurring_every_x"){
            vctCurTasks[ct_i].recurring_every_x = s_cur;
         }
      }//foreach column
   }//foreach row
   qr.free();
   nxg->EndUpdate();
   tray->Text = IntToStr(nxg->RowCount);
   //nxg->BestFitColumns(bfBoth);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnAddTaskClick(TObject *Sender)
{
  TDlgAddTask* dlg = new TDlgAddTask(this);
  dlg->dtpDateDue->Date = cal->Date;

  if (dlg->ShowModal() == mrOk)
  {
     SQLITE3 sqlite("caldo.db");
     String due_date = dlg->dtpDateDue->Text == "" ? String("NULL") :
          "'" + FormatDateTime("yyyy\"-\"mm\"-\"dd", dlg->dtpDateDue->Date) + " 23:59:59'";
     String recurring_unit = "0";
     String recurring_every_x = "0";
     if (dlg->tabRecurringMonthly->Visible){
        recurring_unit = "'month'";
        recurring_every_x = IntToStr((int)dlg->edtMonthlyDay->Value);
     }else if (dlg->tabRecurringWeekly->Visible &&
               dlg->cbxSunday->Checked || dlg->cbxMonday->Checked ||
               dlg->cbxTuesday->Checked || dlg->cbxWednesday->Checked ||
               dlg->cbxThursday->Checked || dlg->cbxFriday->Checked ||
               dlg->cbxSaturday->Checked){
        recurring_unit = "'week'";
        recurring_every_x = "'";
        recurring_every_x += (dlg->cbxSunday->Checked ? "Su" : "  ");
        recurring_every_x += (dlg->cbxMonday->Checked ? "Mo" : "  ");
        recurring_every_x += (dlg->cbxTuesday->Checked ? "Tu" : "  ");
        recurring_every_x += (dlg->cbxWednesday->Checked ? "We" : "  ");
        recurring_every_x += (dlg->cbxThursday->Checked ? "Th" : "  ");
        recurring_every_x += (dlg->cbxFriday->Checked ? "Fr" : "  ");
        recurring_every_x += (dlg->cbxSaturday->Checked ? "Sa" : "  ");
        recurring_every_x += "'";
     }else if (dlg->tabRecurringDaily->Visible){
        recurring_unit = "'daily'";
        recurring_every_x = "'" + FormatDateTime("hh:nn:ss", dlg->edtDailyTime->AsDateTime) + "'";
     }

     String sql = "INSERT INTO todos (id, date_added, memo, date_completed, date_due, recurring_unit, recurring_every_x)"
               " VALUES(NULL, datetime('now'), '" + StringReplace(dlg->memo->Text, "'", "''", TReplaceFlags() << rfReplaceAll) + "',"
               "      0, " + due_date + ", " + recurring_unit + ", " + recurring_every_x + ");";
     if (sqlite.exe(sql.c_str()) != SQLITE_OK){
        ShowMessage("There was an error adding to the database. Restart the program if this continues.");
     }
     /**
     int last_id = sqlite.last_insert_rowid();
     ShowMessage(sql + " last insert id " + IntToStr(last_id));
     sql = "SELECT memo, date_due, date_added FROM todos WHERE id = " + IntToStr(last_id);
     nsSQLITE3::quick_results qr;
     sqlite.quick_exe(sql.c_str(), qr);
     if (qr.nrow == 1){
         String s = qr.result[SQLITE3::calc_absolute_index(1, 0, qr.ncol)];
         s += String(" ") + qr.result[SQLITE3::calc_absolute_index(1, 1, qr.ncol)];
         s += String(" ") + qr.result[SQLITE3::calc_absolute_index(1, 2, qr.ncol)];
         ShowMessage(s);
     }***/
  }
  delete dlg;        
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnDeleteTaskClick(TObject *Sender)
{
   if (nxg->SelectedRow == -1){ return; }
   SQLITE3 sqlite("caldo.db");

   int ct_i = (int)nxg->Row[nxg->SelectedRow]->Data;
   for (unsigned i = 0; i < vctCurTasks.size(); ++i){
       if (ct_i == i){
           ShowMessage(vctCurTasks[i].id);
           String sql = "DELETE FROM todos WHERE id = "+IntToStr(vctCurTasks[i].id);
           sqlite.exe_no_free(sql.c_str());
           nxg->DeleteRow(nxg->SelectedRow);
           calClick(NULL);
           break;
       }
   }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::nxgSelectCell(TObject *Sender, int ACol, int ARow)
{
  btnDeleteTask->Visible = true;        
}
//---------------------------------------------------------------------------


void __fastcall TForm1::FormPaint(TObject *Sender)
{
  OnPaint = NULL;
  cal->Date = TDate().CurrentDate();
  calClick(NULL);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::nxgAfterEdit(TObject *Sender, int ACol, int ARow,
      WideString Value)
{
  if (ACol == 0){
     SQLITE3 sqlite("caldo.db");
     String sql = "SELECT recurring_unit, recurring_every_x FROM todos "
                 " WHERE recurring_unit IS NOT NULL"
                 "   AND recurring_every_x IS NOT NULL"
                 "   AND id = " + IntToStr(vctCurTasks[(int)nxg->Row[ARow]->Data].id);

     sqlite.exe_no_free(sql.c_str());
     sqlite.

     sql = "UPDATE todos SET date_completed = ";
     if (String(Value) == "True"){
        sql +=  "'" + FormatDateTime("yyyy\"-\"mm\"-\"dd hh:nn:ss",
                       TDateTime().CurrentDateTime()) + "'";
     }else{
        sql += "NULL";
     }
     sql += " WHERE id = " + IntToStr(vctCurTasks[(int)nxg->Row[ARow]->Data].id);

     sqlite.exe_no_free(sql.c_str());
  }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::trayDblClick(TObject *Sender)
{
   Application->RestoreTopMosts();        
}
//---------------------------------------------------------------------------


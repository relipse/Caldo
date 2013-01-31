//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "NxCustomGrid.hpp"
#include "NxCustomGridControl.hpp"
#include "NxGrid.hpp"
#include "NxScrollControl.hpp"
#include <ComCtrls.hpp>
#include "NxCollection.hpp"
#include "NxColumnClasses.hpp"
#include "NxColumns.hpp"
#include <ImgList.hpp>
#include <ExtCtrls.hpp>
#include "CoolTrayIcon.hpp"
#include "TextTrayIcon.hpp"
#include <vector>
#include "CaldoTask.h"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TNextGrid *nxg;
        TMemo *memo;
        TNxCheckBoxColumn *nxcCompleted;
        TNxToolbar *nxtoolbar;
        TNxToolButton *btnAddTask;
        TImageList *ImageList1;
        TPanel *Panel1;
        TMonthCalendar *cal;
        TNxHtmlColumn *nxcMemo;
        TNxToolButton *btnDeleteTask;
        TTextTrayIcon *tray;
        TNxHtmlColumn *nxcDateDue;
        TNxHtmlColumn *nxcTime;
        void __fastcall calClick(TObject *Sender);
        void __fastcall btnAddTaskClick(TObject *Sender);
        void __fastcall btnDeleteTaskClick(TObject *Sender);
        void __fastcall nxgSelectCell(TObject *Sender, int ACol, int ARow);
        void __fastcall FormPaint(TObject *Sender);
        void __fastcall nxgAfterEdit(TObject *Sender, int ACol, int ARow,
          WideString Value);
        void __fastcall trayDblClick(TObject *Sender);
private:	// User declarations
        void init_database();
        std::vector<CaldoTask> vctCurTasks;
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif

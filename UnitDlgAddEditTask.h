//----------------------------------------------------------------------------
#ifndef UnitDlgAddEditTaskH
#define UnitDlgAddEditTaskH
//----------------------------------------------------------------------------
#include <vcl\System.hpp>
#include <vcl\Windows.hpp>
#include <vcl\SysUtils.hpp>
#include <vcl\Classes.hpp>
#include <vcl\Graphics.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\Controls.hpp>
#include <vcl\Buttons.hpp>
#include <vcl\ExtCtrls.hpp>
#include "NxEdit.hpp"
#include "NxPageControl.hpp"
//----------------------------------------------------------------------------
class TDlgAddTask : public TForm
{
__published:        
	TButton *OKBtn;
	TButton *CancelBtn;
	TBevel *Bevel1;
        TNxMemo *memo;
        TPanel *Panel1;
        TNxPageControl *NxPageControl2;
        TNxTabSheet *NxTabSheet1;
        TNxTabSheet *NxTabSheet2;
        TNxPageControl *NxPageControl1;
        TNxTabSheet *tabRecurringMonthly;
        TLabel *Label2;
        TNxSpinEdit *edtMonthlyDay;
        TNxTabSheet *tabRecurringWeekly;
        TCheckBox *cbxMonday;
        TCheckBox *cbxTuesday;
        TCheckBox *cbxWednesday;
        TCheckBox *cbxThursday;
        TCheckBox *cbxFriday;
        TCheckBox *cbxSaturday;
        TCheckBox *cbxSunday;
        TNxTabSheet *tabRecurringDaily;
        TLabel *Label1;
        TNxTimeEdit *edtDailyTime;
        TLabel *lblDateDue;
        TNxDatePicker *dtpDateDue;
        TLabel *Label3;
        TNxTimeEdit *NxTimeEdit1;
        TLabel *Label4;
private:
public:
	virtual __fastcall TDlgAddTask(TComponent* AOwner);
};
//----------------------------------------------------------------------------
extern PACKAGE TDlgAddTask *DlgAddTask;
//----------------------------------------------------------------------------
#endif    

//---------------------------------------------------------------------------

#ifndef CaldoTaskH
#define CaldoTaskH

#include <system.hpp>

struct CaldoTask{
  int id;
  String date_added;
  String memo;
  String date_completed;
  String date_due;
  String recurring_unit;
  String recurring_every_x;
};
//---------------------------------------------------------------------------
#endif
 
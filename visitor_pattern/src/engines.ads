pragma Ada_2022;

with Base;

limited with Visitors;

package Engines is

   type Engine_Record is new Base.Base_Record with private;

   procedure Visit (Self : Engine_Record; Visitor : Visitors.Visitor'Class);

private

   type Engine_Record is new Base.Base_Record with null record;

end Engines;

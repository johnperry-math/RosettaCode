pragma Ada_2022;

with Visitors;

package body Engines is

   procedure Visit (Self : Engine_Record; Visitor : Visitors.Visitor'Class) is
   begin
      Visitor.Visit_Engine (Self);
   end Visit;

end Engines;

pragma Ada_2022;

with Visitors;

package body Engines is

   procedure Accept_Visitor
     (Self : Engine_Record; Whom : Visitors.Visitor'Class)
   is
   begin
      Whom.Visit_Engine (Self);
   end Accept_Visitor;

   procedure Visit (Self : Engine_Record; Visitor : Visitors.Visitor'Class) is
   begin
      Visitor.Visit_Engine (Self);
   end Visit;

end Engines;

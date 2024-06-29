pragma Ada_2022;

with Visitors;

package body Bodies is

   procedure Accept_Visitor (Self : Body_Record; Whom : Visitors.Visitor'Class)
   is
   begin
      Whom.Visit_Body (Self);
   end Accept_Visitor;

   procedure Visit (Self : Body_Record; Visitor : Visitors.Visitor'Class) is
   begin
      Visitor.Visit_Body (Self);
   end Visit;

end Bodies;

pragma Ada_2022;

with Visitors;

package body Bodies is

   procedure Visit (Self : Body_Record; Visitor : Visitors.Visitor'Class) is
   begin
      Visitor.Visit_Body (Self);
   end Visit;

end Bodies;

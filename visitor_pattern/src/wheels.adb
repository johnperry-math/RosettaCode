pragma Ada_2022;

with Visitors;

package body Wheels is

   procedure Visit (Self : Wheel_Record; Visitor : Visitors.Visitor'Class) is
   begin
      Visitor.Visit_Wheel (Self);
   end Visit;

   function Initialize (Name : Unbounded_String) return Wheel_Record is
     (My_Name => Name);

   function Name (Me : Wheel_Record) return Unbounded_String is (Me.My_Name);

end Wheels;

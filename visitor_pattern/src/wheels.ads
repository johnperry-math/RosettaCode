pragma Ada_2022;

with Ada.Strings.Unbounded;

with Base;

limited with Visitors;

package Wheels is

   subtype Unbounded_String is Ada.Strings.Unbounded.Unbounded_String;
   use all type Unbounded_String;

   type Wheel_Record is new Base.Base_Record with private;

   procedure Visit (Self : Wheel_Record; Visitor : Visitors.Visitor'Class);

   function Initialize (Name : Unbounded_String) return Wheel_Record;

   function Name (Me : Wheel_Record) return Unbounded_String;

private

   type Wheel_Record is new Base.Base_Record with record
      My_Name : Unbounded_String;
   end record;

end Wheels;

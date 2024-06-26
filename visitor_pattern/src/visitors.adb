pragma Ada_2022;

with Ada.Text_IO;
with Ada.Strings.Unbounded;
use all type Ada.Strings.Unbounded.Unbounded_String;

with Wheels;

package body Visitors is

   package IO renames Ada.Text_IO;

   procedure Visit_Body (Self : Visitor; Dest : Bodies.Body_Record'Class) is
   begin
      Self.Visit_Body (Dest);
   end Visit_Body;

   overriding procedure Visit_Body
     (Self : Perform; Dest : Bodies.Body_Record'Class)
   is
   begin
      IO.Put_Line ("Moving my Body");
   end Visit_Body;

   overriding procedure Visit_Body
     (Self : Print; Dest : Bodies.Body_Record'Class)
   is
   begin
      IO.Put_Line ("Visiting Body");
   end Visit_Body;

   procedure Visit_Car (Self : Visitor; Dest : Cars.Car_Record'Class) is
   begin
      Self.Visit_Car (Dest);
   end Visit_Car;

   overriding procedure Visit_Car
     (Self : Perform; Dest : Cars.Car_Record'Class)
   is
   begin
      IO.Put_Line ("Starting my car");
   end Visit_Car;

   overriding procedure Visit_Car (Self : Print; Dest : Cars.Car_Record'Class)
   is
   begin
      IO.Put_Line ("Visiting Car");
   end Visit_Car;

   procedure Visit_Engine (Self : Visitor; Dest : Engines.Engine_Record'Class)
   is
   begin
      Self.Visit_Engine (Dest);
   end Visit_Engine;

   overriding procedure Visit_Engine
     (Self : Perform; Dest : Engines.Engine_Record'Class)
   is
   begin
      IO.Put_Line ("Revving my Engine");
   end Visit_Engine;

   overriding procedure Visit_Engine
     (Self : Print; Dest : Engines.Engine_Record'Class)
   is
   begin
      IO.Put_Line ("Visiting Engine");
   end Visit_Engine;

   procedure Visit_Wheel (Self : Visitor; Dest : Wheels.Wheel_Record'Class) is
   begin
      Self.Visit_Wheel (Dest);
   end Visit_Wheel;

   overriding procedure Visit_Wheel
     (Self : Perform; Dest : Wheels.Wheel_Record'Class)
   is
   begin
      IO.Put_Line ("Rolling my " & To_String (Dest.Name) & " wheel");
   end Visit_Wheel;

   overriding procedure Visit_Wheel
     (Self : Print; Dest : Wheels.Wheel_Record'Class)
   is
   begin
      IO.Put_Line ("Visiting " & To_String (Dest.Name) & " wheel");
   end Visit_Wheel;

end Visitors;

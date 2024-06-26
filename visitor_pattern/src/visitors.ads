pragma Ada_2022;

limited with Base;
limited with Bodies;
limited with Cars;
limited with Engines;
limited with Wheels;

package Visitors is

   type Visitor is abstract tagged null record;

   procedure Visit_Base
     (Self : Visitor; Dest : Base.Base_Record'Class) is null;

   procedure Visit_Body (Self : Visitor; Dest : Bodies.Body_Record'Class);
   procedure Visit_Car (Self : Visitor; Dest : Cars.Car_Record'Class);
   procedure Visit_Engine (Self : Visitor; Dest : Engines.Engine_Record'Class);
   procedure Visit_Wheel (Self : Visitor; Dest : Wheels.Wheel_Record'Class);

   type Perform is new Visitor with null record;
   type Print is new Visitor with null record;

   overriding procedure Visit_Body
     (Self : Perform; Dest : Bodies.Body_Record'Class);
   overriding procedure Visit_Body
     (Self : Print; Dest : Bodies.Body_Record'Class);

   overriding procedure Visit_Car
     (Self : Perform; Dest : Cars.Car_Record'Class);
   overriding procedure Visit_Car (Self : Print; Dest : Cars.Car_Record'Class);

   overriding procedure Visit_Engine
     (Self : Perform; Dest : Engines.Engine_Record'Class);
   overriding procedure Visit_Engine
     (Self : Print; Dest : Engines.Engine_Record'Class);

   overriding procedure Visit_Wheel
     (Self : Perform; Dest : Wheels.Wheel_Record'Class);
   overriding procedure Visit_Wheel
     (Self : Print; Dest : Wheels.Wheel_Record'Class);

end Visitors;

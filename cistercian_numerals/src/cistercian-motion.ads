--  cistercian-motion.ads
--
--  details information on how to draw each Cistercian stroke
--
--  this is fairly general, so it should be adaptable to any medium,
--  though we have adapted it only to ASCII

pragma Ada_2022;

with Cistercian; use Cistercian;

package Cistercian.Motion is
   type Start_Enum is (Near, Far);
   --  whether the stroke starts at the near or far ordinate

   subtype Motion_Delta is Integer range -1 .. 1;
   --  how the stroke moves across the image in this dimension

   type Motion_Record is record
      --  record of a stroke's motion
      Col_Start, Row_Start : Start_Enum;
      Col_Delta, Row_Delta : Motion_Delta;
   end record;

   Stroke_Arrangement :
     constant array (Quadrant, Cistercian.Strokes_Enum) of Motion_Record :=
       [Ones      =>
          [Diag_From_Far  => (Near, Far, 1, 1),
           Diag_From_Near => (Near, Near, 1, -1),
           Far            => (Near, Far, 1, 0),
           Near           => (Near, Near, 1, 0),
           Side           => (Far, Far, 0, 1)],
        Tens      =>
          [Diag_From_Far  => (Near, Far, -1, 1),
           Diag_From_Near => (Far, Far, 1, 1),
           Far            => (Far, Far, 1, 0),
           Near           => (Far, Near, 1, 0),
           Side           => (Far, Far, 0, 1)],
        Hundreds  =>
          [Diag_From_Far  => (Near, Far, 1, -1),
           Diag_From_Near => (Near, Near, 1, 1),
           Far            => (Near, Far, 1, 0),
           Near           => (Near, Near, 1, 0),
           Side           => (Far, Near, 0, 1)],
        Thousands =>
          [Diag_From_Far  => (Far, Near, 1, 1),
           Diag_From_Near => (Near, Near, -1, 1),
           Far            => (Far, Far, 1, 0),
           Near           => (Far, Near, 1, 0),
           Side           => (Far, Near, 0, 1)]];
   --  maps a quadrant-stoke pair to a motion

end Cistercian.Motion;

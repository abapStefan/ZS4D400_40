CLASS zcl_40_22_local_class_hot DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_40_22_local_class_hot IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA hotel TYPE REF TO lcl_hotel.

  DATA hotel2 TYPE REF TO lcl_hotel.

  DATA hotel3 TYPE REF TO lcl_hotel.


  hotel = NEW #(  ).
     hotel->name = 'Breidenbach SPA Resort'.
     hotel->beds = 345.
     hotel->pools = 7.


   hotel2 = hotel.                                 " Hier wir die Adresse kopiert von 1 nach 2


*  hotel2 = NEW #(  ).
*     hotel2->name = 'Breidenbach 8 Sterne Hotel'.   " mehrere Instanzen der gleichen Klasse
*     hotel2->beds = 645.
*     hotel2->pools = 9.



   hotel3 = NEW #(  ).                             " Im Debugger sind die Attribute dennoch zu sehen

   lcl_hotel=>counter = 1313.





  ENDMETHOD.
ENDCLASS.

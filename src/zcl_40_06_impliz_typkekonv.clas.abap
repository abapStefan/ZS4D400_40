CLASS zcl_40_06_impliz_typkekonv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_06_impliz_typkekonv IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: my_int    TYPE i,
          my_result TYPE p LENGTH 8 DECIMALS 2,
          my_char10 TYPE c LENGTH 11 VALUE 'Breidenbach',
          my_char4  TYPE c LENGTH 4 VALUE 'Home',
          my_string TYPE string.

* Impizite Typkonvertierung

   my_int = '1234'.           " c -> i
   my_result = '-23124.16'.   " c -> p
*   my_int = my_char4.         " c -> i Potenzieller Laufzeitfehler
   my_char4 = my_char10.      " c -> c Potenziellen Informationsverlust, hier Ausgabe nur Brei
   my_string = 'Hallo      '. " c -> String ignoriert schließende Leerzeichen

   out->write(  my_char4 ).





  ENDMETHOD.
ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_kreisberechnung DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.

    CONSTANTS pi TYPE f VALUE ''.

    CLASS-METHODS: umfang IMPORTING radius TYPE f RETURNING VALUE(u) TYPE f.
    CLASS-METHODS: flaeche IMPORTING radius TYPE f RETURNING VALUE(f) TYPE f.
    CLASS-METHODS: durch IMPORTING radius TYPE f RETURNING VALUE(d) TYPE f.
*  CLASS-METHODS: umfang IMPORTING radius TYPE f RETURNING VALUE(u) TYPE f.

  PROTECTED SECTION.
  PRIVATE SECTION.



ENDCLASS.

CLASS lcl_kreisberechnung IMPLEMENTATION.

  METHOD umfang.
    u = 2 * pi * radius.
  ENDMETHOD.


  METHOD flaeche.
    f = pi * radius ** 2.
  ENDMETHOD.


  METHOD durch.
    d = 2 * radius.
  ENDMETHOD.

ENDCLASS.

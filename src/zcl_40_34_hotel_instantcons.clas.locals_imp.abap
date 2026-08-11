*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_hotel DEFINITION CREATE PUBLIC.

  PUBLIC SECTION.

   CLASS-DATA n_o_hotels TYPE i.

   CLASS-METHODS class_constructor.

   METHODS constructor
     IMPORTING
       i_beds TYPE i
       i_pools TYPE i
       i_name TYPE string
       RAISING
           cx_abap_invalid_value.


   METHODS get_attributes
           EXPORTING
           e_name TYPE string
           e_pools TYPE i
           e_beds TYPE i.



   CLASS-METHODS get_n_o_hotels RETURNING VALUE(r_count) TYPE string_table.



  PROTECTED SECTION.



  PRIVATE SECTION.

        DATA beds TYPE i.
        DATA pools TYPE i.
        DATA name TYPE string.


ENDCLASS.

CLASS lcl_hotel IMPLEMENTATION.

  METHOD class_constructor.

   DATA text TYPE STRING.

   text = 'Ich führe hier ein gesamte SELECT Anweisung auf Datenbank aus'.


  ENDMETHOD.

  METHOD constructor.

    IF i_name IS INITIAL OR i_beds IS INITIAL.
     RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    me->beds = i_beds.
    me->pools = i_pools.
    me->name = i_name.
    n_o_hotels = n_o_hotels + 1.

  ENDMETHOD.

  METHOD get_attributes.

    e_name = name.
    e_pools = pools.
    e_beds = beds.

  ENDMETHOD.

  METHOD get_n_o_hotels.

    APPEND |-------------------------------------------------------------------| to r_count.
    APPEND | Gesamtanzahl der Hotels: { n_o_hotels }                           | to r_count.

  ENDMETHOD.

ENDCLASS.

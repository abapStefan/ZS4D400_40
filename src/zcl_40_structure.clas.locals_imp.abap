*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_connection DEFINITION.

PUBLIC SECTION.


    CLASS-DATA conn_counter TYPE i READ-ONLY..


    METHODS get_output RETURNING VALUE(r_output) TYPE string_table.

    METHODS constructor
      IMPORTING
        i_connection_id TYPE /dmo/connection_id
        i_carrier_id TYPE /dmo/carrier_id
        RAISING
        cx_abap_invalid_value.


    METHODS get_attributes
      EXPORTING
        e_carrier_id    TYPE /dmo/carrier_id
        e_connection_id TYPE /dmo/connection_id.


  PROTECTED SECTION.
  PRIVATE SECTION.

    TYPES: BEGIN OF st_details,
             DepartureAirport TYPE /dmo/airport_from_id,
             DestinationAirport   TYPE /dmo/airport_to_id,
             AirlineName    TYPE /dmo/carrier_name,
           END OF st_details.

    DATA details TYPE st_details.

    DATA connection_id TYPE /DMO/connection_id.
    DATA carrier_id TYPE /DMO/carrier_id.

*    DATA airport_from_id TYPE /dmo/airport_from_id.
*    DATA airport_to_id TYPE /dmo/airport_to_id.
*    DATA carrier_name TYPE /dmo/carrier_name.


ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD constructor.

    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

*   SELECT SINGLE FROM /dmo/connection
*   FIELDS airport_from_id, airport_to_id
*   WHERE carrier_id  = @i_carrier_id
*   AND connection_id = @i_connection_id
*   INTO ( @airport_from_id, @airport_to_id ).


    SELECT SINGLE FROM /dmo/I_Connection   " ersetzt durch i_connection
    FIELDS DepartureAirport, DestinationAirport, \_Airline-Name AS AirlineName  " Namen der View  /Pfadausdruck
    WHERE AirlineID = @i_carrier_id
    AND  ConnectionID = @i_connection_id
*    INTO ( @airport_from_id, @airport_to_id, @carrier_name ).
    INTO CORRESPONDING FIELDS OF @details.

   IF sy-subrc <> 0.
   RAISE EXCEPTION TYPE cx_abap_invalid_value.
   ENDIF.

    connection_id = i_connection_id.
    carrier_id = i_carrier_id.

    conn_counter = conn_counter + 1.

  ENDMETHOD.

  METHOD get_attributes.

    e_carrier_id = carrier_id.
    e_connection_id = connection_id.

  ENDMETHOD.

  METHOD get_output.

    APPEND |---------------------------------------------------------| TO r_output.
    APPEND | Carrier:     { carrier_id  } { details-airlinename }    | TO r_output.
    APPEND | Connection   { connection_ID }                          | TO r_output.
    APPEND | Departure:   { details-departureairport }               | TO r_output.
    APPEND | Destination  { details-destinationairport }             | TO r_output.

  ENDMETHOD.


ENDCLASS.

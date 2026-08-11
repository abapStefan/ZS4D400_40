CLASS LHC_ZR_40FLIGHT DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR Flight
        RESULT result,
      validatePrice FOR VALIDATE ON SAVE
            IMPORTING keys FOR Flight~validatePrice,
      validateCurrencyCode FOR VALIDATE ON SAVE
            IMPORTING keys FOR Flight~validateCurrencyCode.
ENDCLASS.

CLASS LHC_ZR_40FLIGHT IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.

  METHOD validatePrice.

    DATA failed_record LIKE LINE OF failed-flight.
    DATA reported_record LIKE LINE OF reported-flight.

    READ ENTITIES OF zr_40flight IN LOCAL MODE
    ENTITY flight
    FIELDS ( price )
    WITH CORRESPONDING #( keys )
    RESULT DATA(flights).

    LOOP AT flights INTO DATA(flight).

      IF flight-price <= 0.

        failed_record-%tky = flight-%tky.
        APPEND failed_record TO failed-flight.

        reported_record-%tky = flight-%tky.

        reported_record-%msg =
          new_message(
                id = 'Z40_MESSAGE'
                number = '004'
                severity = if_abap_behv_message=>severity-error ).

        APPEND reported_record TO reported-flight.

      ENDIF.

    ENDLOOP.


  ENDMETHOD.

  METHOD validateCurrencyCode.

  DATA failed_record LIKE LINE OF failed-flight.
    DATA reported_record LIKE LINE OF reported-flight.

    DATA exists TYPE abap_bool.   " kommt erst in Aufgabe 5

    exists = abap_false.


    READ ENTITIES OF zr_40flight IN LOCAL MODE
            ENTITY flight
            FIELDS ( currencycode )
            WITH CORRESPONDING #( keys )
            RESULT DATA(flights).

    LOOP AT flights INTO DATA(flight).
      SELECT SINGLE FROM i_currency  WITH PRIVILEGED ACCESS
      FIELDS @abap_true
      WHERE currency = @flight-CurrencyCode
      INTO @exists.

      IF exists = abap_false. " the currency code is not valid

        failed_record-%tky = flight-%tky.
        APPEND failed_record TO failed-flight.

        reported_record-%tky = flight-%tky.
        reported_record-%msg =
        new_message(
        id = 'Z40_MESSAGE'
        number = '005'
        severity = if_abap_behv_message=>severity-error
        v1 = flight-currencycode
        ).

        APPEND reported_record TO reported-flight.

      ENDIF.

    ENDLOOP.


  ENDMETHOD.

ENDCLASS.

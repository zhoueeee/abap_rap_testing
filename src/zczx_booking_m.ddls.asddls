@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bokking Projection View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCZX_BOOKING_M
  as projection on zizx_booking_m
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      LastChangedAt,
      /* Associations */
      _BookingStatus,
      _BookingSupplement : redirected to composition child ZCZX_BOOKSUPP_M,
      _Carrier,
      _Connection,
      _Currency,
      _Customer,
      _Travel            : redirected to parent ZCZX_TRAVEL_M
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Projection View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCZX_BOOKSUPP_M
  as projection on zizx_booksupp_m
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      SupplementId,
      @Semantics.amount.currencyCode:'CurrencyCode'
      Price,
      CurrencyCode,
      LastChangedAt,
      /* Associations */
      _Booking : redirected to parent ZCZX_BOOKING_M,
      _Product,
      _SupplementText,
      _Travel  : redirected to ZCZX_TRAVEL_M
}

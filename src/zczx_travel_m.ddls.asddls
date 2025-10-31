@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travelling Projection View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCZX_TRAVEL_M
  provider contract transactional_query
  as projection on zizx_travel_m

{
  key TravelId,
      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode:'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode:'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZCZX_BOOKING_M,
      _Currency,
      _Customer,
      _Status
}

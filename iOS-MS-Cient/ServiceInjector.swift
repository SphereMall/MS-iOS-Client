//
//  Resources.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 11/29/17.
//  Copyright © 2017 SphereMall. All rights reserved.
//

import UIKit

public class ServiceInjector: NSObject {
    
    private var client : SMClient? = nil
    
    override init() {
        super.init()
        guard let client = self as? SMClient else {
            fatalError("ServiceInjector not have SMClient")
        }
        
        self.client = client
    }
    
    public lazy var user: UsersResource! = {
        return UsersResource<UserSM>(client: client!)
    } ()
    
    public lazy var address: AddressResource! = {
        return AddressResource<AddressSM>(client: client!)
    } ()
    
    public lazy var companies: CompaniesResource! = {
        return CompaniesResource<CompaniesSM>(client: client!)
    } ()
    
    public lazy var messages: MessagesResource! = {
        return MessagesResource<MessagesSM>(client: client!)
    } ()
    
    public lazy var ordesStatuses: OrderStatusesResource! = {
        return OrderStatusesResource<MessagesSM>(client: client!)
    } ()
    
    public lazy var orders: OrdersResource! = {
        return OrdersResource<OrdersSM>(client: client!)
    } ()
    
    public lazy var basket: BasketResource! = {
        return BasketResource<BasketSM>(client: client!, version: "v2")
    } ()
    
    public lazy var wishlist: WishListItemsResource! = {
        return WishListItemsResource<WishlistSM>(client: client!)
    } ()
    
    public lazy var products: ProductsResource! = {
        return ProductsResource<ProductsSM>(client: client!)
    } ()

    public lazy var attributeDisplayTypes: AttributeDisplayTypesResource! = {
        return AttributeDisplayTypesResource<AttributeDisplayTypesSM>(client: client!)
    } ()
    
    public lazy var attributeGroupsEntities: AttributeGroupsEntitiesResource! = {
        return AttributeGroupsEntitiesResource<AttributeGroupsEntitiesSM>(client: client!)
    } ()
    
    public lazy var attributeGroups: AttributeGroupsResource! = {
        return AttributeGroupsResource<AttributeGroupsSM>(client: client!)
    } ()
    
    public lazy var attributes: AttributesResource! = {
        return AttributesResource<AttributesSM>(client: client!)
    } ()
    
    public lazy var attributeTypes: AttributeTypesResource! = {
        return AttributeTypesResource<AttributeTypesSM>(client: client!)
    } ()
    
    public lazy var attributeValues: AttributeValuesResource! = {
        return AttributeValuesResource<AttributeValuesSM>(client: client!)
    } ()
    
    public lazy var entityAttributes: EntityAttributesResource! = {
        return EntityAttributesResource<EntityAttributesSM>(client: client!)
    } ()
    
    public lazy var brands: BrandsResource! = {
        return BrandsResource<BrandsSM>(client: client!)
    } ()
    
    public lazy var catalogItems: CatalogItemsResource! = {
        return CatalogItemsResource<CatalogItemsSM>(client: client!)
    } ()
    
    public lazy var etities: EntitiesResource! = {
        return EntitiesResource<EntitiesSM>(client: client!)
    } ()
    
    public lazy var media: MediaResource! = {
        return MediaResource<MediaSM>(client: client!)
    } ()
    
    public lazy var mediaTypes: MediaTypesResource! = {
        return MediaTypesResource<MediaTypesSM>(client: client!)
    } ()
    
    public lazy var functionalNames: FunctionalNamesResource! = {
        return FunctionalNamesResource<FunctionalNameSM>(client: client!)
    } ()
    
    public lazy var options: OptionsResource! = {
        return OptionsResource<OptionsResourceSM>(client: client!)
    } ()
    
    public lazy var productAttributeValues: ProductAttributeValuesResource! = {
        return ProductAttributeValuesResource<ProductAttributeValuesSM>(client: client!)
    } ()
    
    public lazy var vats: VatsResource! = {
        return VatsResource<VatsSM>(client: client!)
    } ()
    
    public lazy var deliveryPayments: DeliveryPaymentsResource! = {
        return DeliveryPaymentsResource<DeliveryPaymentSM>(client: client!)
    } ()
    
    public lazy var currenciesRate: CurrenciesRateResource! = {
        return CurrenciesRateResource<CurrencyRateSM>(client: client!)
    } ()
    
    public lazy var paymentProviders: PaymentProvidersResource! = {
        return PaymentProvidersResource<PaymentProvidersSM>(client: client!)
    } ()
    
    public lazy var invoices: InvoicesResource! = {
        return InvoicesResource<InvoiceSM>(client: client!)
    } ()
    
    public lazy var paymentMethods: PaymentMethodsResource! = {
        return PaymentMethodsResource<PaymentMethodsSM>(client: client!)
    } ()
    
    public lazy var deliveryProviders: DeliveryProvidersResource! = {
        return DeliveryProvidersResource<DeliveryProviderSM>(client: client!)
    } ()
    
    public lazy var documents: DocumentsResource! = {
        return DocumentsResource<DocumentsSM>(client: client!)
    } ()
    
    public lazy var currencies: CurrenciesResource! = {
        return CurrenciesResource<CurrenciSM>(client: client!)
    } ()
    
    public lazy var correlations: CorrelationsResource! = {
        return CorrelationsResource<ProductsSM>(client: client!)
    } ()
    
    public lazy var grid: GridResource! = {
        return GridResource<GridSM>(client: client!)
    } ()
    
    public lazy var auth: AuthResource! = {
        return AuthResource<UserSM>(client: client!)
    } ()
    
    public lazy var priceConfigurator: ProductPriceConfigurationsResource! = {
        return ProductPriceConfigurationsResource<PriceValueSM>(client: client!)
    } ()
    
    public lazy var promotions: PromotionsRecource! = {
        return PromotionsRecource<PromotionsSM>(client: client!)
    } ()

    public lazy var externalUser: ExternalUserRelationResource! = {
        return ExternalUserRelationResource<ExternalUserSM>(client: client!)
    } ()
}

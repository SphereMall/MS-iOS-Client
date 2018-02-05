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
    
    lazy var user: UsersResource! = {
        return UsersResource<UserSM>(client: client!)
    } ()
    
    lazy var address: AddressResource! = {
        return AddressResource<AddressSM>(client: client!)
    } ()
    
    lazy var companies: CompaniesResource! = {
        return CompaniesResource<CompaniesSM>(client: client!)
    } ()
    
    lazy var messages: MessagesResource! = {
        return MessagesResource<MessagesSM>(client: client!)
    } ()
    
    lazy var ordesStatuses: OrderStatusesResource! = {
        return OrderStatusesResource<MessagesSM>(client: client!)
    } ()
    
    lazy var orders: OrdersResource! = {
        return OrdersResource<OrdersSM>(client: client!)
    } ()
    
    lazy var basket: BasketResource! = {
        return BasketResource<BasketSM>(client: client!)
    } ()
    
    lazy var wishListItems: WishListItemsResource! = {
        return WishListItemsResource<WishlistSM>(client: client!)
    } ()
    
    lazy var products: ProductsResource! = {
        return ProductsResource<ProductsSM>(client: client!)
    } ()

    lazy var attributeDisplayTypes: AttributeDisplayTypesResource! = {
        return AttributeDisplayTypesResource<AttributeDisplayTypesSM>(client: client!)
    } ()
    
    lazy var attributeGroupsEntities: AttributeGroupsEntitiesResource! = {
        return AttributeGroupsEntitiesResource<AttributeGroupsEntitiesSM>(client: client!)
    } ()
    
    lazy var attributeGroups: AttributeGroupsResource! = {
        return AttributeGroupsResource<AttributeGroupsSM>(client: client!)
    } ()
    
    lazy var attributes: AttributesResource! = {
        return AttributesResource<AttributesSM>(client: client!)
    } ()
    
    lazy var attributeTypes: AttributeTypesResource! = {
        return AttributeTypesResource<AttributeTypesSM>(client: client!)
    } ()
    
    lazy var attributeValues: AttributeValuesResource! = {
        return AttributeValuesResource<AttributeValuesSM>(client: client!)
    } ()
    
    lazy var entityAttributes: EntityAttributesResource! = {
        return EntityAttributesResource<EntityAttributesSM>(client: client!)
    } ()
    
    lazy var brands: BrandsResource! = {
        return BrandsResource<BrandsSM>(client: client!)
    } ()
    
    lazy var catalogItems: CatalogItemsResource! = {
        return CatalogItemsResource<CatalogItemsSM>(client: client!)
    } ()
    
    lazy var etities: EntitiesResource! = {
        return EntitiesResource<EntitiesSM>(client: client!)
    } ()
    
    lazy var media: MediaResource! = {
        return MediaResource<MediaSM>(client: client!)
    } ()
    
    lazy var mediaTypes: MediaTypesResource! = {
        return MediaTypesResource<MediaTypesSM>(client: client!)
    } ()
    
    lazy var functionalNames: FunctionalNamesResource! = {
        return FunctionalNamesResource<FunctionalNameSM>(client: client!)
    } ()
    
    lazy var options: OptionsResource! = {
        return OptionsResource<OptionsResourceSM>(client: client!)
    } ()
    
    lazy var productAttributeValues: ProductAttributeValuesResource! = {
        return ProductAttributeValuesResource<ProductAttributeValuesSM>(client: client!)
    } ()
    
    lazy var vats: VatsResource! = {
        return VatsResource<VatsSM>(client: client!)
    } ()
    
    lazy var deliveryPayments: DeliveryPaymentsResource! = {
        return DeliveryPaymentsResource<DeliveryPaymentSM>(client: client!)
    } ()
    
    lazy var currenciesRate: CurrenciesRateResource! = {
        return CurrenciesRateResource<CurrencyRateSM>(client: client!)
    } ()
    
    lazy var paymentProviders: PaymentProvidersResource! = {
        return PaymentProvidersResource<PaymentProvidersSM>(client: client!)
    } ()
    
    lazy var invoices: InvoicesResource! = {
        return InvoicesResource<InvoiceSM>(client: client!)
    } ()
    
    lazy var paymentMethods: PaymentMethodsResource! = {
        return PaymentMethodsResource<PaymentMethodsSM>(client: client!)
    } ()
    
    lazy var deliveryProviders: DeliveryProvidersResource! = {
        return DeliveryProvidersResource<DeliveryProviderSM>(client: client!)
    } ()
    
    lazy var documents: DocumentsResource! = {
        return DocumentsResource<DocumentsSM>(client: client!)
    } ()
    
    lazy var currencies: CurrenciesResource! = {
        return CurrenciesResource<CurrenciSM>(client: client!)
    } ()
    
}

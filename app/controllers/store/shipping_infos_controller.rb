class Store::ShippingInfosController < ApplicationController
  include Concerns::Letters
  respond_to :html

  let(:resource, on: ['new', 'create']) { current_order.build_shipping_info }
  let(:resource, on: ['edit', 'update']) { current_order.shipping_info }

  def new
    raise_not_found if current_order.shipping_info.present?
    respond_with resource
  end

  def create
    raise_not_found if current_order.shipping_info.present?
    resource.update_attributes(permitted_params)
    respond_with resource, location: [:store, :order]
  end

  def edit
    raise_not_found if current_order.shipping_info.blank?
    respond_with resource
  end

  def update
    raise_not_found if current_order.shipping_info.blank?
    resource.update_attributes(permitted_params)
    respond_with resource, location: [:store, :order]
  end

  protected def permitted_params
    params.require(:order_shipping_info).permit(
      :country_id,
      :shipping_name,
      :phone_number,
      :shipping_address_line1,
      :shipping_address_line2,
      :shipping_city,
      :shipping_state,
      :shipping_zip
    )
  end
end

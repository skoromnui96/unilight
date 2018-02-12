<?php
class ControllerModuleProductTab extends Controller {	
	public function index($setting) {

		if(!isset($this->request->get['route']) || $this->request->get['route'] != 'product/product'){
		$this->document->addScript('catalog/view/javascript/jquery/tabs.js');
		}

		static $module = 0;

		$this->language->load('module/product_tab');
		
      	$data['heading_title'] = $this->language->get('heading_title');

      	$data['tab_latest'] = $this->language->get('tab_latest');
      	$data['tab_featured'] = $this->language->get('tab_featured');
      	$data['tab_bestseller'] = $this->language->get('tab_bestseller');
      	$data['tab_special'] = $this->language->get('tab_special');

		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['button_cart'] = $this->language->get('button_cart');
		$data['text_tax'] = $this->language->get('text_tax');
		$data['our_products'] = $this->language->get('our_products');
		$data['text_more'] = $this->language->get('text_more');

		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');

		//Latest Products
		
		$data['latest_products'] = array();

		if($setting['latest_products']){
		
			$filter_data = array(
				'sort'  => 'p.date_added',
				'order' => 'DESC',
				'start' => 0,
				'limit' => $setting['limit']
			);
			
			$latest_results = $this->model_catalog_product->getLatestProducts($filter_data);

			if ($latest_results) {
				foreach ($latest_results as $result) {
					if ($result['image']) {
						$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}

					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price = false;
					}

					if ((float)$result['special']) {
						$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $result['rating'];
					} else {
						$rating = false;
					}

					$data['latest_products'][] = array(
						'product_id'  => $result['product_id'],
						'thumb'       => $image,
						'name'        => $result['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'rating'      => $rating,
						'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
                        'upc_description'   => $this->language->get('upc_description'),
					);
				}
			}
		}

		//Specials product

		$data['special_products'] = array();

		if($setting['special_products']){

			$special_data = array(
				'sort'  => 'pd.name',
				'order' => 'ASC',
				'start' => 0,
				'limit' => $setting['limit']
			);

			$special_results = $this->model_catalog_product->getProductSpecials($special_data);

			if ($special_results) {
				foreach ($special_results as $result) {
					if ($result['image']) {
						$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}

					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price = false;
					}

					if ((float)$result['special']) {
						$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $result['rating'];
					} else {
						$rating = false;
					}

					$data['special_products'][] = array(
						'product_id'  => $result['product_id'],
						'thumb'       => $image,
						'name'        => $result['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'rating'      => $rating,
						'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
                        'upc'         => $result['upc'],
                        'sku'         => $result['ean'],
                        'jan'         => $result['jan'],
                        'entry_upc'   => $this->language->get('entry_upc'),
                        'entry_sku'   => $this->language->get('entry_sku'),
                        'entry_jan'   => $this->language->get('entry_jan'),
                        'upc_description'   => $this->language->get('upc_description'),
					);
				}
			}
		}

		//BestSeller
		$data['bestseller_products'] = array();

		if($setting['bestseller_products']){

			$bestseller_results = $this->model_catalog_product->getBestSellerProducts($setting['limit']);
			
			if ($bestseller_results) {
				foreach ($bestseller_results as $result) {
					if ($result['image']) {
						$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}

					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price = false;
					}

					if ((float)$result['special']) {
						$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $result['rating'];
					} else {
						$rating = false;
					}

					$data['bestseller_products'][] = array(
						'product_id'  => $result['product_id'],
						'thumb'       => $image,
						'name'        => $result['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'rating'      => $rating,
						'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
                        'upc'         => $result['upc'],
                        'sku'         => $result['ean'],
                        'jan'         => $result['jan'],
                        'entry_upc'   => $this->language->get('entry_upc'),
                        'entry_sku'   => $this->language->get('entry_sku'),
                        'entry_jan'   => $this->language->get('entry_jan'),
                        'upc_description'   => $this->language->get('upc_description'),
					);
				}
			}
		}

		//Featured
		$data['featured_products'] = array();

		if($setting['featured_products'] && $setting['product']){


			if (empty($setting['limit'])) {
				$setting['limit'] = 5;
			}
			
			$products = array_slice($setting['product'], 0, (int)$setting['limit']);

			
			foreach ($products as $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);

				if ($product_info) {
					if ($product_info['image']) {
						$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}

					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price = false;
					}

					if ((float)$product_info['special']) {
						$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $product_info['rating'];
					} else {
						$rating = false;
					}

					$data['featured_products'][] = array(
						'product_id'  => $product_info['product_id'],
						'thumb'       => $image,
						'name'        => $product_info['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'rating'      => $rating,
						'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
                        'upc'         => $product_info['upc'],
                        'sku'         => $product_info['ean'],
                        'jan'         => $product_info['jan'],
                        'entry_upc'   => $this->language->get('entry_upc'),
                        'entry_sku'   => $this->language->get('entry_sku'),
                        'entry_jan'   => $this->language->get('entry_jan'),
                        'upc_description'   => $this->language->get('upc_description'),
					);
				}
			}
		}

		$data['module'] = $module++;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/product_tab.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/product_tab.tpl', $data);
		} else {
			return $this->load->view('default/template/module/product_tab.tpl', $data);
		}
	}
}

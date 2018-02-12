<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_about'] = $this->language->get('text_about');
		$data['text_blog'] = $this->language->get('text_blog');
		$data['text_lams'] = $this->language->get('text_lams');
		$data['text_bra'] = $this->language->get('text_bra');
		$data['text_spots'] = $this->language->get('text_spots');
		$data['text_floor_lamps'] = $this->language->get('text_floor_lamps');
		$data['desk_lamp'] = $this->language->get('desk_lamp');
		$data['street_lights'] = $this->language->get('street_lights');
		$data['text_accessories'] = $this->language->get('text_accessories');
		$data['text_phone'] = $this->language->get('text_phone');
		$data['text_email'] = $this->language->get('text_email');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_work_mode'] = $this->language->get('text_work_mode');
		$data['text_site_dev'] = $this->language->get('text_site_dev');

        if (isset($this->request->get['path'])) {
        $parts = explode('_', (string)$this->request->get['path']);
    } else {
            $parts = array();
        }

        if (isset($parts[0])) {
            $data['category_id'] = $parts[0];
        } else {
            $data['category_id'] = 0;
        }


        $this->load->model('catalog/category');

        $this->load->model('catalog/product');

        $data['categories'] = array();

        $categories = $this->model_catalog_category->getCategories(0);

        foreach ($categories as $category) {
            $children_data = array();

            if ($category['category_id'] == $data['category_id']) {
                $children = $this->model_catalog_category->getCategories($category['category_id']);

                foreach($children as $child) {
                    $filter_data = array('filter_category_id' => $child['category_id'], 'filter_sub_category' => true);

                    $children_data[] = array(
                        'category_id' => $child['category_id'],
                        'name' => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                        'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
                    );
                }
            }

            $filter_data = array(
                'filter_category_id'  => $category['category_id'],
                'filter_sub_category' => true
            );

            $data['categories'][] = array(
                'category_id' => $category['category_id'],
                'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                'children'    => $children_data,
                'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
            );
        }



		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', 'SSL');
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', 'SSL');
		$data['affiliate'] = $this->url->link('affiliate/account', '', 'SSL');
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');

        $data['telephone'] = $this->config->get('config_telephone');
        $data['telephone2'] = $this->config->get('config_telephone2');
        $data['telephone3'] = $this->config->get('config_telephone3');
        $data['telephone3'] = $this->config->get('config_telephone3');
        $data['email'] = $this->config->get('config_email');
        $data['address'] = $this->config->get('config_address');
        $data['open'] = nl2br($this->config->get('config_open'));

        $data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/footer.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/footer.tpl', $data);
		} else {
			return $this->load->view('default/template/common/footer.tpl', $data);
		}
	}
}

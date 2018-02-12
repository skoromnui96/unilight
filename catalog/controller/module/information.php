<?php
class ControllerModuleInformation extends Controller {
	public function index() {
		$this->load->language('module/information');

		$data['want'] = $this->language->get('want');
		$data['text'] = $this->language->get('text');
		$data['registration'] = $this->language->get('registration');
		$data['name'] = $this->language->get('name');
		$data['email'] = $this->language->get('email');
		$data['phone'] = $this->language->get('phone');
		$data['name_placeholder'] = $this->language->get('name_placeholder');
		$data['button_text'] = $this->language->get('button_text');
		$data['private_policy'] = $this->language->get('private_policy');

		$this->load->model('catalog/information');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/information.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/information.tpl', $data);
		} else {
			return $this->load->view('default/template/module/information.tpl', $data);
		}
	}
}
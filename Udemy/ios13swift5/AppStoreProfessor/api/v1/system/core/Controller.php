<?php


header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");


/**
 * CodeIgniter
 *
 * An open source application development framework for PHP
 *
 * This content is released under the MIT License (MIT)
 *
 * Copyright (c) 2014 - 2016, British Columbia Institute of Technology
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * @package	CodeIgniter
 * @author	EllisLab Dev Team
 * @copyright	Copyright (c) 2008 - 2014, EllisLab, Inc. (https://ellislab.com/)
 * @copyright	Copyright (c) 2014 - 2016, British Columbia Institute of Technology (http://bcit.ca/)
 * @license	http://opensource.org/licenses/MIT	MIT License
 * @link	https://codeigniter.com
 * @since	Version 1.0.0
 * @filesource
 */
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Application Controller Class
 *
 * This class object is the super class that every library in
 * CodeIgniter will be assigned to.
 *
 * @package		CodeIgniter
 * @subpackage	Libraries
 * @category	Libraries
 * @author		EllisLab Dev Team
 * @link		https://codeigniter.com/user_guide/general/controllers.html
 */


class CI_Controller {

	/**
	 * Reference to the CI singleton
	 *
	 * @var	object
	 */
	private static $instance;
	private static $chaveJWT = "9BAA718C24F68EB";
	private $token = null;
	private $appId = array("web", "android", "ios");

	/**
	 * Class constructor
	 *
	 * @return	void
	 */
	public function __construct()
	{
		self::$instance =& $this;

		// Assign all the class objects that were instantiated by the
		// bootstrap file (CodeIgniter.php) to local class variables
		// so that CI can run as one big super object.
		foreach (is_loaded() as $var => $class)
		{
			$this->$var =& load_class($class);
		}

		$this->load =& load_class('Loader', 'core');
		$this->load->initialize();
		log_message('info', 'Controller Class Initialized');
	}

	// --------------------------------------------------------------------

	/**
	 * Get the CI singleton
	 *
	 * @static
	 * @return	object
	 */
	public static function &get_instance()
	{
		return self::$instance;
	}


	public function statusCode($codigo, $obj){
		return $this->output
			->set_status_header($codigo)
			->set_content_type('application/json')
			->set_output(json_encode($obj));
	}

	public function statusCode200($obj){
		return $this->output
			->set_status_header(200)
			->set_content_type('application/json')
			->set_output(json_encode($obj));
	}

	public function statusCode401($msg = "Não autorizado!"){
		return $this->output
			->set_status_header(401)
			->set_content_type('application/json')
			->set_output(json_encode(array('mensagem' => $msg)));
	}

	public function statusCode403($msg = "Não foi possível acessar o recurso!"){
		return $this->output
			->set_status_header(403)
			->set_content_type('application/json')
			->set_output(json_encode(array('mensagem' => $msg)));
	}

	public function statusCode500($msg = "Error inesperado."){
		return $this->output
			->set_status_header(500)
			->set_content_type('application/json')
			->set_output(json_encode(array('mensagem' => $msg)));
	}




	public function urlCanal($data){
		if($data != ""){
				return base_url()."public/upload/canal/".$data;
		}
		return null;
	}
	public function urlVideo($data){
		if($data != ""){
				return base_url()."public/upload/video/".$data;
		}
		return null;
	}

	public function sigla($string){
		$nomes = explode(" ", $this->sanitizeString($string));
		$sigla = "";
		if (count($nomes) > 1){
			for ($i=0; $i < count($nomes); $i++) {
				if ($i < 2) {
					$sigla .= $nomes[$i][0];
				}
			}
		}else{
			$sigla .= $nomes[0][0];
			$sigla .= $nomes[0][1];
		}
		return strtoupper($sigla);
	}


	public function sanitizeString($string) {
    $what = array( 'ä','ã','à','á','â','ê','ë','è','é','ï','ì','í','ö','õ','ò','ó','ô','ü','ù','ú','û','À','Á','É','Í','Ó','Ú','ñ','Ñ','ç','Ç',' ','-','(',')',',',';',':','|','!','"','#','$','%','&','/','=','?','~','^','>','<','ª','º' );
    $by   = array( 'a','a','a','a','a','e','e','e','e','i','i','i','o','o','o','o','o','u','u','u','u','A','A','E','I','O','U','n','n','c','C',' ','_','_','_','_','_','_','_','_','_','_','_','_','_','_','_','_','_','_','_','_','_','_' );
    return str_replace($what, $by, $string);
	}

	public function randomCharacters($quantidade){
			return strtoupper(substr(str_shuffle(str_repeat("abcdefghijklmnopqrstuvwxyz", $quantidade)), 0, $quantidade));
	}


}

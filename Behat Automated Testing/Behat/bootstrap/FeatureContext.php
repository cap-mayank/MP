<?php

use Behat\Behat\Context\ClosuredContextInterface,
    Behat\Behat\Context\TranslatedContextInterface,
    Behat\Behat\Context\BehatContext,
    Behat\Behat\Exception\PendingException;
use Behat\Mink\Session,
    Behat\Mink\Driver\DriverInterface,
    Behat\Mink\Element\ElementInterface,
    Behat\Mink\Exception\ElementException,
    Behat\Mink\Exception\ElementNotFoundException;
use Behat\Gherkin\Node\PyStringNode,
    Behat\Gherkin\Node\TableNode;
use Behat\MinkExtension\Context\MinkContext;
use Behat\Mink\Element\NodeElement;
use Behat\Mink\Element\TraversableElement;
use Symfony\Component\BrowserKit\Cookie;
use Behat\Behat\Event\StepEvent;
use Behat\Behat\Context\Step;
use Behat\Mink\Exception\ResponseTextException; 
use SensioLabs\Behat\PageObjectExtension\Context\PageObjectContext;



//
// Require 3rd-party libraries here:
//
//   require_once 'PHPUnit/Autoload.php';
//   require_once 'PHPUnit/Framework/Assert/Functions.php';
//

/**
 * Features context.
 */
class FeatureContext extends MinkContext
{
    var $gsite="page";
    /**
     * Initializes context.
     * Every scenario gets it's own context object.
     *
     * @param array $parameters context parameters (set them up through behat.yml)
     */
    public function __construct(array $parameters)
    {

       
	}


/**
 * @Given /^ I log in with "([^"]*)" and "([^"]*)"$/
 */
public function thatILogInWithAnd($username, $password)
	{
		$this->getSession()->setBasicAuth($username,$password);
	}

/**
* @When /^I click apply for job/
*/
public function clickApply()
	{
		$old = $session = $this->getSession()->getCurrentUrl();
		$new = str_replace("job-detail","job-apply",$old);
		$this->getSession()->visit($new);
	}


/**
* @When /^I search for "([^"]*)"$/
*/
public function iSearchFor($arg1)
	{
		$this->fillField('edit-search', $arg1);
	}

/**
* @When /^I search for location "([^"]*)"$/
*/
public function iSearchForLocation ($location)
	{
		$this->fillField('edit-location',$location);
	}
  
  
/**
* @When /^I take screenshot/
*/
public function takeScreen()
	{
		static $screenName = 1;
		file_put_contents('..\Screenshots\\' . $screenName . '.png', $this->getSession()->getScreenshot());
		$screenName = $screenName + 1;
	}

/**
* @When /^I set min salary "([^"]*)"$/
*/
public function minSalary($min)
	{
		$this->fillField('edit-field-job-salary-min',$min);
	}
  
/**
* @When /^I set max salary "([^"]*)"$/
*/
public function maxSalary($max)
	{
		$this->fillField('edit-field-job-salary-max',$max);
	}
  
/**
* @Given /^I set the cookie/
*/
public function iSetCookie()
	{
		$this->getSession()->setCookie("__xwny", "");
	}
  

//START LOGIN FUNCTIONS ------------------------------------------------------

/**
* @When /^I enter username "([^"]*)"$/
*/
public function userName ($user) 
	{
		$this->fillField('edit-name',$user);
	}

/**
* @When /^I enter password "([^"]*)"$/
*/
public function password ($pword) 
	{
		$this->fillField('edit-pass',$pword);
	}


//END LOGIN FUNCTIONS---------------------------------------------------------

/**
* @Given /^I wait (\d+) seconds$/
*/
public function iWaitForSeconds($seconds)
	{
		$this->getSession()->wait($seconds*1000);
	}
  
//START RESIZE FUNCTIONS ----------------------------------------------
  
/**
* @Given /^I maximise the window/
*/
public function iMaximise()
   {
		$this->getSession()->resizeWindow(1366,728, null);
   }
  
/**
* @When /^I use a phone/
*/
public function resizeIphone()
	{
		$this->getSession()->resizeWindow(640,960,null);
	}
  
/**
* @When /^I use a tablet/
*/
public function resizeIpad()
	{
		$this->getSession()->resizeWindow(1024,768,null);
	}
  
  
//END RESIZE FUNCTIONS------------------------------------------------------  

//GENERIC FUNCTIONS---------------------------------------------------------
//**********************************************************************************************************************************************************************************************//
//Purpose : These functions are generic functions which are used for performing generic operations.
//Created on : 12 May 2014
//Author : Mike Conroy, Joe Baldwin, Sahil Mehta, Lavin Malkani
//
//**********************************************************************************************************************************************************************************************//

//GENERIC "I Click" FUNCTION TO AID GHERKIN SYNTAX

/**
*@When /^I click "([^"]*)"$/
*/ 
public function iClick ($arg1)
	{
		if (substr($arg1,0,1)=='.') {
		  $this->iPressTheElement($arg1);
		}

		elseif (substr($arg1,0,1)=='/' || substr($arg1,0,5)=='http:') {
		  $this->iClickOnTheElementWithXPath($arg1);
		}

		else{
		  $this->iClickOnTheText($arg1);
		}
	}

/**
* @When /^I press the element "([^"]*)"$/
*/
public function iPressTheElement ($arg1)
   {
		$node = $this->getSession()->getPage()->find('css', $arg1);
		$node->click();
		
		if (null === $arg1) {
			throw new \InvalidArgumentException(sprintf('Could not evaluate Element: "%s"', $arg1));
		}

	}

/**
 * Click on the element with the provided xpath query
 *
 * @When /^I click on the element with xpath "([^"]*)"$/
 */
 //CLICK ON HREF FUNCTION
public function iClickOnTheElementWithXPath($xpath)
    {
        $session = $this->getSession(); // get the mink session
        $element = $session->getPage()->find('xpath',$xpath);
        
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate XPath: "%s"', $xpath));
        }
        
        $element->click();
 
    }

/**
*
*
* @When /^I click on the text "([^"]*)"$/
*/
public function iClickOnTheText($text)
    {
        $session = $this->getSession();
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', '*//*[text()="'. $text .'"]')
        );
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Cannot find text: "%s"', $text));
        }
 
        $element->click();
 
    }
  
/**
* @When /^I click the button "([^"]*)"$/
*/
public function iPressButton($button)
  {
    $this->pressButton($button);
  }
 
//**********************************************************************************************************************************************************************************************//
//Purpose : This function is for checking a part of the url is as expected
//Created on : 09 May 2014
//Author : Sahil Mehta
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//
  
/**
* @Then /^I check url "([^"]*)"$/
*/
public function iCheckurl($url)
	{
		$node = $this->getSession()->getCurrentUrl();
		if (null === $node ) {
			throw new \InvalidArgumentException(sprintf('Could not get url: "%s"', $url));
		}
		if (preg_match("/".$url."/",$node) == 1) {

		}  
	}
//**********************************************************************************************************************************************************************************************//
//Purpose : This function is for checking a part of the url is as expected
//Created on : 1 oct 2014
//Author : Lavin malkani
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//
  
/**
* @Then /^I check redirecturl "([^"]*)"$/
*/
public function iCheckredirecturl($url)
	{
		$url=ltrim($url,'http://');
		$url=ltrim($url,'https://');

		$node = $this->getSession()->getCurrentUrl();
		$node=ltrim($node,'http://');
		$node=ltrim($node,'https://');

		if (null === $node ) {
			throw new \InvalidArgumentException(sprintf('Could not get url: "%s"', $url));
		}
		if ($node == $url ) {

		}
		else	{
			throw new \InvalidArgumentException(sprintf('incorrect redirection: "%s"', $node));
		}
    
	}
  
  //**********************************************************************************************************************************************************************************************//
//Purpose : This function is for checking Url redirect
//Created on : 1 oct 2014
//Author : Lavin malkani
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//
  
/**
* @Then /^I Compare RedirectUrl "([^"]*)" and "([^"]*)"$/
*/
public function iCompareredirecturl($firsturl,$secondurl)
	{
		$this->getSession()->visit($firsturl);
		$this->iWaitForSeconds(2);
		$firstnode = $this->getSession()->getCurrentUrl();
		
		$firstnode=ltrim($firstnode,'http://');
		$firstnode=ltrim($firstnode,'https://');
	  
		$this->getSession()->visit($secondurl);	
		$this->iWaitForSeconds(2);
		$secondnode = $this->getSession()->getCurrentUrl();
		
		$secondnode=ltrim($secondnode,'http://');
		$secondnode=ltrim($secondnode,'https://');
	  
		if (null === $firstnode ) {
            throw new \InvalidArgumentException(sprintf('Could not get firsturl: "%s"', $firsturl));
        }
		if (null === $secondnode ) {
            throw new \InvalidArgumentException(sprintf('Could not get secondurl: "%s"', $secondurl));
		}
		if ($firstnode == $secondnode ) {
		
		}
		else {
		throw new \InvalidArgumentException(sprintf('First URL redirected to:"%s"', $firstnode.' Second URL redirected to: "%s"'.$secondnode));
		//throw new \InvalidArgumentException(sprintf('target first:"%s"', $secondnode));
		}
    
	}

//**********************************************************************************************************************************************************************************************//
//Purpose : This function is used to attach a document.
//Created on : 12 May 2014
//Author : Lavin Malkani
//
//**********************************************************************************************************************************************************************************************//

/**
* @Given /^I attach the local file "([^"]*)" to "([^"]*)"$/
*/
public function uploadLocalFile($file, $xpath)
    {
	   // $session = $this->getSession(); // get the mink session
        //$element = $session->getPage()->find('xpath', $xpath); 
       // $field = $this->fixStepArgument($element);
	   If($file != "")	{
        $path = __DIR__;
        $npath = str_replace("\features\bootstrap", "", $path);
        $fpath = $npath . "\\" . $file;
		//echo $path;
	       try {
            $this->getSession()->getDriver()->attachFile($xpath, $fpath);
        } catch (\Exception $exception) {
            throw new ElementException($this, $exception);
        }
		}
    }
  
//**********************************************************************************************************************************************************************************************//
//Purpose : This function is for checking the presence of the element with xpath and reload if the presence is not found
//Created on : 09 May 2014
//Author : Sahil Mehta
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//

 /**
 * @Given /^I check for element with xpath to reload "([^"]*)"$/
 *
 */
 public function existelementreload($xpath)
	{
		//$i=0;
		//while($i < 5){
        $session = $this->getSession(); // get the mink session
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', $xpath)
        ); 
 
        
        if (null === $element) {
            //throw new \InvalidArgumentException(sprintf('Could not evaluate XPath: "%s"', $xpath));
			$session->reload();
			//$i++;
			//$this->iWaitForSeconds(6);
        }
		//else {
			//$i=6;
		//}
	//} 
 }

//**********************************************************************************************************************************************************************************************//
//Purpose : This function is for checking the presence of the element with the locator as xpath
//Created on : 09 May 2014
//Author : Sahil Mehta
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//

 /**
 * @Given /^I check for element with xpath "([^"]*)"$/
 *
 */
 public function existelementxpath($xpath)
	{
        $session = $this->getSession(); // get the mink session
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', $xpath)
        ); 
 
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate XPath: "%s"', $xpath));
			echo $element->isVisible();
			return null;
        }
		else {
			return $element->isVisible();
			echo $element->isVisible();
		}
  
	}
 
//**********************************************************************************************************************************************************************************************//
//Purpose : This function is for checking the presence of the element with the locator as css
//Created on : 09 May 2014
//Author : Sahil Mehta
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//

 /**
 * @Given /^I check for element with css "([^"]*)"$/
 *
 */
 public function existelementcss($css)
	{
        $session = $this->getSession(); // get the mink session
        $element = $this->getSession()->getPage()->find('css', $arg1);
 
        if (null === $element) {
            //throw new \InvalidArgumentException(sprintf('Could not evaluate XPath: "%s"', $xpath));
			return null;
        }
		else {
			return $element->isVisible();
		}
	}
 
//**********************************************************************************************************************************************************************************************//
//Purpose : This function is for checking the presence of the element
//Created on : 09 May 2014
//Author : Sahil Mehta
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//

 /**
 * @Given /^I check for element "([^"]*)"$/
 * 
 */
 public function existelement($arg1)
	{
	 
		if (substr($arg1,0,1)=='.') {
		  $el = $this->existelementcss($arg1);
		}

		elseif (substr($arg1,0,1)=='/' || substr($arg1,0,5)=='http:') {
		  $el = $this->existelementxpath($arg1);
		}
		
		if (null === $el) {
			throw new \InvalidArgumentException(sprintf('Could not see : "%s"', $arg1));
		}
		elseif ($el != 1) {
			throw new \InvalidArgumentException(sprintf('Element not visible on page : "%s"', $arg1));
		}
	}

//**********************************************************************************************************************************************************************************************//
//Purpose : This function is for waiting for suggestion box to appear
//Created on : 09 May 2014
//Author : Sahil Mehta
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//

/**
 * @Then /^I wait for the suggestion box to appear$/
 */
public function iWaitForTheSuggestionBoxToAppear()
	{
		$this->getSession()->wait(5000,
			"$('.autocomplete').children().length > 0"
		);
	}

//**********************************************************************************************************************************************************************************************//
//Purpose : This function is for implementing mouse over a field
//Created on : 09 May 2014
//Author : Sahil Mehta
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//

/**
 * @When /^I hover over the element "([^"]*)"$/
 */
public function iHoverOverTheElement($locator)
	{		
		$element=null;
        $session = $this->getSession();
		$xlocator= "//span[contains(text(),'HoverField')]";
		$finallocator = str_replace("HoverField",$locator,$xlocator);

		if (substr($finallocator,0,1)=='/' || substr($finallocator,0,5)=='http:') {
		  $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', $finallocator)
        ); 			//returns the element after running the query by using xpath
		}
        // errors must not pass silently throw exception
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate CSS selector or XPath: "%s"', $locator));
        }
        // ok, let's hover it
		$element->focus();
        $element->mouseOver();
		$element->click();
	}

//**********************************************************************************************************************************************************************************************//
//Purpose : This function is for counting and comparing the number of child elements in specified locator
//Created on : 09 May 2014
//Author : Sahil Mehta
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//

/**
 * @When /^I count number of child elements for "([^"]*)"$/
 */
public function iCountChild($locator)
	{
        $session = $this->getSession();
		if (substr($locator,0,1)=='.') {
		  $element = $session->getPage()->findAll('css', $locator);	//returns the element after running the query by using css
		}

		elseif (substr($locator,0,1)=='/' || substr($locator,0,5)=='http:') {
		  $element = $session->getPage()->findAll(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', $locator)
        ); 			//returns the element after running the query by using xpath
		}
        // errors must not pass silently throw exception
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate CSS selector or XPath: "%s"', $locator));
        }
		//Count the number of child elements
        $size= sizeof($element);
		return $size;
		//echo $size;
		//error if not equal to expected
		//If ($size != $number) {
		//	throw new \InvalidArgumentException(sprintf('The number of child elements not as expected: "%s"', $number));
		//}
	}

//**********************************************************************************************************************************************************************************************//
//Purpose : This function is to fill in the field with the locator as xpath
//Created on : 09 May 2014
//Author : Sahil Mehta
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//

/**
 * @When /^I fill in "([^"]*)" with value "([^"]*)"$/
 */
public function fillFieldsxpath($locator, $value)
    {
		$session = $this->getSession();
        $field = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', $locator)
			);

        if (null === $field) {
            throw new ElementNotFoundException(
                $this->getSession(), 'form field', 'id|name|label|value', $locator
            );
        }

        $field->setValue($value);
    }

//**********************************************************************************************************************************************************************************************//
//Purpose : This function is for selecting an option in listbox/dropdown with the locator as xpath
//Created on : 09 May 2014
//Author : Sahil Mehta
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//
	
/**
 * @When /^I select "([^"]*)" from xpath "([^"]*)"$/
 */
public function selectFieldsxpath($value, $locator)
    {
		$session = $this->getSession();
        $field = $session->getPage()->find('xpath',$locator);

        if (null === $field) {
            throw new ElementNotFoundException(
                $this->getSession(), 'form field', 'xpath', $locator
            );
        }
        $field->selectoption($value);
    }

//**********************************************************************************************************************************************************************************************//
//Purpose : This function is for visiting the michaelpage site with specified Environment and Country
//Created on : 09 May 2014
//Author : Sahil Mehta
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//
	
/**
 * @When /^I go to "([^"]*)" with env "([^"]*)" and country "([^"]*)"$/
 */
public function VisitPage($site,$env,$country)
    {
        $this->gsite=$site;	
		$old="http://michaelpage:5UCred8e@wwwuat.pagesite.com.sg/";
		If ($country ==="au" or $country ==="sg" or $country ==="hk" or $country ==="my" or $country ==="cn") {
			//$site = michaelpage or pagepersonnel
			$base = str_replace("pagesite",$site,$old);
			//$env = the environment in which it needs to be run
			$new = str_replace("uat",$env,$base);
			//$country = all the countries supported by Page
			$url = str_replace("sg",$country,$new);
		}
		elseif ($country ==="in" or $country ==="nz" or $country ==="jp" or $country ==="uk" or $country ==="za")  {
			//$site = michaelpage or pagepersonnel
			$base = str_replace("pagesite",$site,$old);
			//$env = the environment in which it needs to be run
			$envnew = str_replace("uat",$env,$base);
			$new= str_replace("com","co",$envnew);
			$url= str_replace("sg",$country,$new);
		}
		elseif ($country ==="us")	{
			//$site = michaelpage or pagepersonnel
			$base = str_replace("pagesite",$site,$old);
			//$env = the environment in which it needs to be run
			$envnew = str_replace("uat",$env,$base);
			$url= str_replace(".sg","",$envnew);
		}
		elseif ($country ==="ie" or $country ==="ae" or $country ==="at" )	{
			//$site = michaelpage or pagepersonnel
			$base = str_replace("pagesite",$site,$old);
			//$env = the environment in which it needs to be run
			$envnew = str_replace("uat",$env,$base);
			$url= str_replace("com.sg",$country,$envnew);
		}
		$this->getSession()->visit($url);
		
    }

//**********************************************************************************************************************************************************************************************//
//Purpose : This function is for visiting mypage login for michaelpage sites with specified Environment and Country
//Created on : 15 May 2014
//Author : Lavin Malkani
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//
	
/**
 * @When /^I go to "([^"]*)" mypage with env "([^"]*)" and country "([^"]*)"$/
 */
public function VisitMypage($site,$env,$country)
    {	
	    $this->gsite=$site;
		$old="http://michaelpage:5UCred8e@wwwuat.pagesite.com.sg/mypage/profile";
		If ($country ==="au" or $country ==="sg" or $country ==="hk" or $country ==="my" or $country ==="cn") {
			//$site = michaelpage or pagepersonnel
			$base = str_replace("pagesite",$site,$old);
			//$env = the environment in which it needs to be run
			$new = str_replace("uat",$env,$base);
			//$country = all the countries supported by Page
			$url = str_replace("sg",$country,$new);
		}
		elseif ($country ==="in" or $country ==="nz" or $country ==="jp" or$country ==="uk" or $country ==="za"){
			//$site = michaelpage or pagepersonnel
			$base = str_replace("pagesite",$site,$old);
			//$env = the environment in which it needs to be run
			$envnew = str_replace("uat",$env,$base);
			$new= str_replace("com","co",$envnew);
			$url= str_replace("sg",$country,$new);
		}
		elseif ($country ==="us")	{
			//$site = michaelpage or pagepersonnel
			$base = str_replace("pagesite",$site,$old);
			//$env = the environment in which it needs to be run
			$envnew = str_replace("uat",$env,$base);
			$url= str_replace(".sg","",$envnew);
		}
		elseif ($country ==="ie" or $country ==="ae" or $country ==="at")	{
			//$site = michaelpage or pagepersonnel
			$base = str_replace("pagesite",$site,$old);
			//$env = the environment in which it needs to be run
			$envnew = str_replace("uat",$env,$base);
			$url= str_replace("com.sg",$country,$envnew);
		}
		$this->getSession()->visit($url);
    }

//**********************************************************************************************************************************************************************************************//
//Purpose : This function is for modifying the URL for multilingual sites
//Created on : 18 Feb 2015
//Author : Aniket Kharade
//Improvements/Modifications/Changes history|Reason    |Date  |Done By |
//
//**********************************************************************************************************************************************************************************************//
 /**
  * @When /^I check with country "([^"]*)" and language "([^"]*)"$/
  */
public function checkWithCountry($country,$language)
    {
		$session = $this->getSession();
		$detailurl=$session->getCurrentUrl();
		if($language === "en" and ($country === "jp" or $country === "at"))
			{
				$new_url=$detailurl."en";
				$session->visit($new_url);
			}
		elseif($language === "zh")
			{
				$new_url=$detailurl."zh";
				$session->visit($new_url);
			}
		else
			{
				$session->visit($detailurl);
			}
        
    }



//**********************************************************************************************************************************************************************************************//
//Purpose : This function is for checking a check box with xpath
//Created on : 15 May 2014
//Author : Lavin Malkani
//Improvements/Modifications/Changes history|Reason    |Date  |Done By |
//
//**********************************************************************************************************************************************************************************************//
 /**
  * @When /^I check with xpath"([^"]*)"$/
  */
public function checkFieldxpath($locator)
    {
		$session = $this->getSession();
        $field = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', $locator)
			);

        if (null === $field) {
			throw new ElementNotFoundException(
                $this->getSession(), 'form field', 'xpath', $locator
            );
        }
        $field->check();
    }

//**********************************************************************************************************************************************************************************************//
//Purpose : This function is used for login with user name password
//Created on : 15 May 2014
//Author : Lavin Malkani
//Improvements/Modifications/Changes history|Reason    |Date  |Done By |
//
//**********************************************************************************************************************************************************************************************// 
  /**
   * @When /^I login with "([^"]*)" and "([^"]*)"$/
   */
  public function Login($user,$pword) 
  {
	$this->getSession()->getPage()->fillField('edit-name',$user);
	$this->getSession()->getPage()->fillField('edit-pass',$pword);
	$this->iClickOnTheElementWithXPath("//input[@id='edit-submit'][not(contains(@onclick,'return hideCv()'))]"); 
  }
 
//**********************************************************************************************************************************************************************************************//
//Purpose : This function is used for selecting a radio button on a form
//Created on : 15 May 2014
//Author : Lavin Malkani
//Improvements/Modifications/Changes history|Reason    |Date  |Done By |
//
//**********************************************************************************************************************************************************************************************// 
  /**
  * @Given /^I select the "([^"]*)" radio button$/
  */
    public function iSelectTheRadioButton($radio_label) 
	{
      $radio_button = $this->getSession()->getPage()->findField($radio_label);
      if (null === $radio_button) {
        throw new ElementNotFoundException(
          $this->getSession(), 'form field', 'label', $radio_label
        );
      }
      $value=$radio_button->getAttribute('value');
	  $this->getSession()->getDriver()->click($radio_button->getXPath());
      //$this->fillField($radio_label, $value);
    }

//**********************************************************************************************************************************************************************************************//
//Purpose : This function is for clicking on various elements and links or buttons throughout Page site
//Created on : 16 May 2014
//Author : Sahil Mehta
//Improvements/Modifications/Changes history|Reason												|Date		|Done By	|
//Added to select jobs on search result page|Click any numbered job specified on the result page|20/8/2014	|Sahil
//**********************************************************************************************************************************************************************************************//
 /**
 * @When /^I click "([^"]*)" on "([^"]*)"$/
 */
public function ClickOn($value,$place)
    {
		//For footer links clicking
		if ($place === "footer")	{
			$prev="//*[contains(@class,'footer')]//a[contains(text(),'name')]";
			$xpath=str_replace("name",$value,$prev);
		}
		if ($place === "sliders")	{
			$prev="//*[contains(@class,'browsecv jsloaded')]//a[contains(@href,'#browsejobs')]";
			If ($value === "Submit your CV")	{
				$nvalue="submitcv";
			}
			elseif ($value === "Browse for jobs")	{
				$nvalue="browsejobs";
			}
			//$value= browsejobs or submitcv
			$xpath=str_replace("browsejobs",$nvalue,$prev);			
		}
		//For clicking on forms buttons (Submit CV,Job apply, Submit job spec, Request call back,Salary appraisal,Feedback)
		if ($place === "form")	{
			$prev="//form[not(contains(@id,'mp-cv-submit-block-form-display'))]//input[@value='Submit']";
			$xpath=str_replace("Submit",$value,$prev);
		}
		if ($place === "popup")	{
			$prev="//*[@id='popup']//*[contains(text(),'button')]";
			$xpath=str_replace("button",$value,$prev);
		}
		if ($place === "searchresult")	{
			$prev="//li[1]/div/a";
			$nvalue=str_replace("job ","",$value);
			$xpath=str_replace("1",$nvalue,$prev);
		}
		if ($place === "meganav menu")             
		{
             $prev="//nav[@id='meganav-mega_menu_option']//a[contains(text(),'internal')]";
			   //$prev="//a[@class='mega_menu_option']//a[contains(text(),'internal')]";
             list($menuoption, $internaloption) = explode(":", $value);
             //to get the correct mega menu
             //NOTE: menuoption should be in lower case and should be seperated by an _ and not spaces between the words
             $mvalue=str_replace("option",$menuoption,$prev);
             //to click on the option inside the specified mega menu
             $xpath=str_replace("internal",$internaloption,$mvalue);
        }
    
		$this->iClickOnTheElementWithXPath($xpath);
		
	}	

//**********************************************************************************************************************************************************************************************//
//Purpose : This function is for filling fields throughout Page site
//Created on : 21 May 2014
//Author : Sahil Mehta
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//

/**
 * @When /^I fill "([^"]*)" in "([^"]*)" on "([^"]*)"$/
 */
public function FillIn($data,$value,$place)
    {
		//For Search jobs block on homepage and job search result page
		if ($place === "search jobs")	{
			$prev="//*[@role='application']//input[@name='identifier']";
			$xpath=str_replace("identifier",$value,$prev);			
		}
		$this->fillFieldsxpath($xpath,$data);
		
	}
	
//**********************************************************************************************************************************************************************************************//
//Purpose : This function is used for grabbing a text of the xpath mentioned and returning it
//Created on : 23 May 2014
//Author : Sahil Mehta
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//
/**
 * @When /^I grab text from the xpath "([^"]*)"$/
 * parameters: xpath of the text that needs to be grabbed
 * returns : the entire text split by spaces passed as an array 
 */
public function GrabTextWithXpath($xpath)
	{
		$grabresult=$this->getSession()->getPage()->find('xpath',$xpath);
		//$searchresult=preg_split("[\s]",(string)$grabresult->getText());
		$result=(string)$grabresult->getText();
		return $result;
	}

//**********************************************************************************************************************************************************************************************//
//Purpose : This function for logging out from mypage account
//Created on : 30 June 2014
//Author : Sahil Mehta
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//
/**
 * @When /^I logout$/
 */
public function logout()
	{
		//Goto Mypage profile
		$this->iClickOnTheElementWithXPath("//a[@data-meganav='mega_menu_mypage']");
		$this->iWaitForSeconds(2);
		$this->iClickOnTheElementWithXPath("//*[@class='region region-right-side-content']//*[contains(text(),'Log out')]");
		$this->iWaitForSeconds(2);
	}	
	
//**********************************************************************************************************************************************************************************************//
//Purpose : This function to navigate to external job apply URL
//Created on : 05 August 2014
//Author : Lavin Malkani
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//To incorporate Changes for  |4/5/2015|Lavin 
//**********************************************************************************************************************************************************************************************//
/**
 * @When /^I redirect to external job apply page for "([^"]*)"$/
 */
public function VistExternalJobapplyUrl($country)
	{
		//Goto External job apply Page
		$session=$this->getSession();
		$detailurl=$session->getCurrentUrl();
	
		If ($country ==="au" or $country ==="sg" or $country ==="hk" or $country ==="my" or $country ==="nz"or $country ==="in"or $country ==="cn"or $country ==="jp")
		{
		list($https,$dummy,$domain,$jdetail,$jtitle,$ref,$refnum)=preg_split("[/]",$detailurl);
			$externalapply = $https.$domain."/"."job-apply-external"."/".$ref."/".$refnum;
		}
		elseif ($country ==="uk" or $country ==="ie" or $country ==="us" or $country ==="za" or $country ==="at")
		{
			//$externalapply = $detailurl."?aplitrak_email=dGVzdG1pY2hhZWxwYWdlQGdtYWlsLmNvbQ&source=bean&_ad=broadbean";
			$externalapply = $detailurl."?aplitrak_email=dGVzdG1pY2hhZWxwYWdlQGdtYWlsLmNvbQ&utm_source=Indeed&utm_medium=Job Board&utm_campaign=Indeed%2520Organic";
		}
	
		$session->visit($externalapply);
		
		
	}
//**********************************************************************************************************************************************************************************************//
//Purpose : This function to Sign in to linkden
//Created on : 30 October 2014
//Author : Lavin Malkani
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//
/**
 * @When /^I Sign in to linden with username "([^"]*)" and Password "([^"]*)"$/
 */
public function SignInLinkden($user,$pword) 
	{
		$this->getSession()->getPage()->fillField('session_key-oauth2SAuthorizeForm',$user);
		$this->getSession()->getPage()->fillField('session_password-oauth2SAuthorizeForm',$pword);
		$this->iClickOnTheElementWithXPath("//input[@value='Allow access']"); 
	}
  
//**********************************************************************************************************************************************************************************************//
//Purpose : This function to click on apply button on job detail page.
//Created on : 20 August 2014
//Author : Lavin Malkani
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//
/**
 * @When /^I check for Apply button $/
 */
/* public function CheckApplybutton()
	{
		//Check for apply button
		$apply = $this->existelementxpath("//a[contains(text(),'Apply')");	
		echo $apply;
	}
 */

//END GENERIC FUNCTIONS------------------------------------------------------


//DRIVER FUNCTIONS FOR PAGES HAVING XPATHS MENTIONED------------------------------------------------------
//**********************************************************************************************************************************************************************************************//
//Purpose : These functions would be drivers for the elements on the pages and this will help remove the xpath visibility in feature files.
//Created on : 12 May 2014
//Author : Sahil Mehta
//
//**********************************************************************************************************************************************************************************************//



//**********************************************************************************************************************************************************************************************//
//Purpose : This function is for filling forms -> Submit CV, Submit Job Spec, Request Call Back, Job Apply, Request Salary Appraisal
//Created on : 13 May 2014
//Author : Sahil Mehta , Lavin Malkani
//Improvements/Modifications/Changes history	|Reason					|Date		|Done By	|
//Added a new form for request a call back      	        			|7/8/2014	|Aniket
//Added a new form for Feedback form                	     			|11/8/2014	|Aniket
//Added a new form for Salary Appraisal form                   			|11/8/2014	|Aniket
//**********************************************************************************************************************************************************************************************//

/**
 * @When /^I fill "([^"]*)" form for country "([^"]*)" and parameters "([^"]*)"$/
 */
public function FillForm($form,$country,$para)
    {	
		$pagesite=$this->gsite;
		//For Submit job spec
		If($form === "submit-job-spec" or $form === "upload-job-description")	{
			list($name,$company,$email,$tel,$location_hk,$location_au,$location_sg,$location_in,$location_my,$location_nz,$location_uk,$location_us,$location_ie,$location_jp,$location_cn,$location_ae,$location_za,$location_at,$sector,$detail,$jobspec)=preg_split("[,]",$para);
			$this->getSession()->getPage()->fillField("edit-submitted-mp-name",$name);
			$this->getSession()->getPage()->fillField("edit-submitted-mp-company",$company);
			$this->getSession()->getPage()->fillField("edit-submitted-mp-email",$email);
			$this->getSession()->getPage()->fillField("edit-submitted-mp-telephone",$tel);
			$this->getSession()->getPage()->selectFieldOption("edit-submitted-mp-discipline-of-job",$sector);
			if($country!= "ie" and $country!= "za" and $country!="at")
			{
			$var='location_'.$country;
			
			// Logic for generating the Location ID based on Sector ID
				if($country === "us" or ($country === "uk" AND $pagesite === "pagepersonnel"))
				{	  
					if (strpos($sector,' ') > 0) // Finding ID of sector element with multiple words during runtime.
					{	
					   $id="";
					   $newele=strtolower($sector); // Converts every upper-case character  into lower-case
					   $newID=explode(" ", $newele); // Break the string into Array.
					   $max=count($newID); // Return the number of elements in an Array.
					   $i=0;
						while($i<$max)
						{
							// IF Loop for replacing the "&" with "and" 
							if ($newID[$i]=="&")
							{
								$newID[$i]="and";
							}
							$id=$id . "-" . $newID[$i]; // Generate the new ID
							$genID =ltrim($id,"-"); // Remove characters from the left side of a string
							$i++;
						}
					}
					else
					{
						$ele=strtolower($sector);
						$genID=$ele;
					}
					if($sector!="")
					{	
						$old="edit-submitted-logistics-locations";
						$new = str_replace("logistics",$genID,$old);
						$this->getSession()->getPage()->selectFieldOption($new,$$var);
					
					}
				}
				elseif($country==="ae"){
				$new="edit-submitted-location";
				$this->getSession()->getPage()->selectFieldOption($new,$$var);
				
				}
				else
				{
				$this->getSession()->getPage()->selectFieldOption("edit-submitted-mp-location-of-job",$$var); 
				}
			}
			
			if((($country === "ie" ) AND $pagesite === "michaelpage") or ($country === "uk" AND $pagesite === "pagepersonnel")) 
			{
			$this->getSession()->getPage()->fillField("edit-submitted-details-of-job-specification",$detail); 			
			}
			elseif(($country === "us" or $country === "uk" or $country === "at" or $country === "ae") AND $pagesite === "michaelpage")
			{
			$this->getSession()->getPage()->fillField("edit-submitted-details-of-job-spec",$detail); 
			}
			$this->uploadLocalFile($jobspec,"//input[@id='edit-submitted-mp-details-of-job-specification-upload']");
		}
		//For Request Call Back
		elseif($form === "request-call-back")	{
			list($name,$job_title,$organisation,$tel,$email,$sector,$location_hk,$location_au,$location_sg,$location_in,$location_my,$location_nz,$location_us,$location_uk,$location_ie,$location_jp,$location_cn,$location_ae,$location_za,$location_at,$Message)=preg_split("[,]",$para);
			$this->getSession()->getPage()->fillField("edit-submitted-mp-name",$name);
			$this->getSession()->getPage()->fillField("edit-submitted-mp-job-title",$job_title);
			$this->getSession()->getPage()->fillField("edit-submitted-mp-organisation",$organisation);
			$this->getSession()->getPage()->fillField("edit-submitted-mp-telephone",$tel);
			$this->getSession()->getPage()->fillField("edit-submitted-mp-email",$email);
			$this->getSession()->getPage()->selectFieldOption("edit-submitted-mp-discipline-of-job",$sector);
			if($country!="ie" and $country!="at")
			{
			$var='location_'.$country;
			// Logic for generating the Location ID based on Sector ID
				if($country === "us" or ($country === "uk" AND $pagesite === "pagepersonnel"))
				{	  
					if (strpos($sector,' ') > 0) //  Finding ID of sector element with multiple words during runtime.
					{	
					   $id="";
					   $newele=strtolower($sector); // Converts every upper-case character  into lower-case
					   $newID=explode(" ", $newele); // Break the string into Array.
					   $max=count($newID); // Return the number of elements in an Array.
					   $i=0;
						while($i<$max)
						{
							// IF Loop for replacing the "&" with "and" 
							if ($newID[$i]=="&")
							{
								$newID[$i]="and";
							}
							$id=$id . "-" . $newID[$i]; // Generate the new ID
							$genID =ltrim($id,"-"); // Remove characters from the left side of a string
							$i++;
						}
					}
					else
					{
						$ele=strtolower($sector);
						$genID=$ele;
					}
					if($sector!=""){
					$old="edit-submitted-logistics-locations";
					$new = str_replace("logistics",$genID,$old);
					$this->getSession()->getPage()->selectFieldOption($new,$$var);
				}
				}
				elseif($country ==="za"){
				$this->getSession()->getPage()->selectFieldOption("edit-submitted-locations",$$var); 
				}
			    elseif($country ==="ae"){
				$this->getSession()->getPage()->selectFieldOption("edit-submitted-location",$$var); 
				}
				else
				{
				$this->getSession()->getPage()->selectFieldOption("edit-submitted-mp-location-of-job",$$var);
				}
			}
			$this->getSession()->getPage()->fillField("edit-submitted-mp-brief-message",$Message);
		}
        //For Feedback form
          elseif($form === "submit-feedback")	
		  {
		    list($name,$email,$telephone,$Complaint_subject,$Comments)=preg_split("[,]",$para);
			$this->getSession()->getPage()->fillField("edit-submitted-mp-name",$name);
			$this->getSession()->getPage()->fillField("edit-submitted-mp-email",$email);
			if($country==="uk" and $pagesite==="pagepersonnel")
			{
			        $this->getSession()->getPage()->fillField("edit-submitted-phone-number",$telephone);
					$this->getSession()->getPage()->selectFieldOption("edit-submitted-mp-complaint-subject",$Complaint_subject); 
			}
			elseif($country==="us")
			{
					$this->getSession()->getPage()->selectFieldOption("edit-submitted-feedback-subject",$Complaint_subject);
			}
			else
			{
			$this->getSession()->getPage()->selectFieldOption("edit-submitted-mp-feedback-subject",$Complaint_subject); 
			}
			$this->getSession()->getPage()->fillField("edit-submitted-mp-comments",$Comments);
		}
		//For salary appraisal
       elseif($form === "salary-appraisal-request")
		{

			list($fname,$lname,$sector,$Job_title,$salary,$state,$format,$email,$tel)=preg_split("[,]",$para);
			if(($country === "au" or $country === "nz") AND $pagesite === "michaelpage")
			{
					$this->getSession()->getPage()->fillField("edit-submitted-mp-first-name",$fname);
					$this->getSession()->getPage()->fillField("edit-submitted-mp-last-name",$lname);
			}
			elseif($country === "au" AND $pagesite === "pagepersonnel")
			{
					$this->getSession()->getPage()->fillField("edit-submitted-mp-salary-appraisal-uname",$fname);
					
					$this->getSession()->getPage()->fillField("edit-submitted-last-name",$lname);
					
			}
			elseif((($country === "jp" or $country === "cn") AND $pagesite === "michaelpage") or ($country === "hk" AND $pagesite === "pagepersonnel"))
			{
			$this->getSession()->getPage()->fillField("edit-submitted-name",$fname); 
			}
			elseif($country ==="sg" AND $pagesite === "pagepersonnel")
			{
			$this->getSession()->getPage()->fillField("edit-submitted-pp-name",$fname);  
			}
			else
			{
					$this->getSession()->getPage()->fillField("edit-submitted-mp-name",$fname);  
	        }
			
			//if($country!= "sg" AND $pagesite === "pagepersonnel"){
         	$this->getSession()->getPage()->selectFieldOption("edit-submitted-sector",$sector);  
			//}
			
			if((($country === "au" or $country === "in") AND $pagesite === "michaelpage") or ($country === "au" AND $pagesite === "pagepersonnel")) 
			{
				$this->getSession()->getPage()->selectFieldOption("edit-submitted-state",$state);
			}
			
			$this->getSession()->getPage()->fillField("edit-submitted-current-job-title",$Job_title); 
			
			$this->getSession()->getPage()->fillField("edit-submitted-current-salary",$salary); 
		
			$this->getSession()->getPage()->selectFieldOption("edit-submitted-preferred-format-for-appraisal",$format); 
			
			$this->getSession()->getPage()->fillField("edit-submitted-email",$email); 
			
			
			/* if(($country === "au" or $country === "sg" or $country === "hk" or $country === "in" or $country === "nz") AND $pagesite === "michaelpage" ){
			$this->getSession()->getPage()->fillField("edit-submitted-mp-telephone",$tel); 
			
			}
			else */
			if(($country === "sg" or $country === "hk") AND $pagesite === "pagepersonnel" )
			{
					$this->getSession()->getPage()->fillField("edit-submitted-telephone-no",$tel); 
			}
			elseif(($country === "au" AND $pagesite === "pagepersonnel") or (($country === "jp" or $country === "cn") AND $pagesite === "michaelpage"))
			{
					$this->getSession()->getPage()->fillField("edit-submitted-telephoone-no",$tel); 
					}
			else
			{
				$this->getSession()->getPage()->fillField("edit-submitted-mp-telephone",$tel);
			}
		}
		//For job apply with linkden
        elseif($form === "job-apply-linkden")	{
			list($email,$tel)=preg_split("[,]",$para);
			If ($email !=="ignore"){
			$this->fillFieldsxpath("//form[@id='mp-linkedin-cv-apply-form']//*[@id='edit-email']",$email);
			}
			If ($email !=="ignore"){
			$this->fillFieldsxpath("//form[@id='mp-linkedin-cv-apply-form']//*[@id='edit-telephone']",$tel);
			}
		}
		
		//For Job Apply Without Login
		elseif($form === "jobapply") {
			list($firstname,$lastname,$email,$currentjob,$currentsalary,$browsecv,$message,$bcreatalert,$bprivacy)=preg_split("[,]",$para);
			$this->fillFieldsxpath("//form[contains(@action,'job-apply')]//*[@id='edit-firstname']",$firstname);
			$this->fillFieldsxpath("//form[contains(@action,'job-apply')]//*[@id='edit-lastname']",$lastname);
			$this->fillFieldsxpath("//form[contains(@action,'job-apply')]//*[@id='edit-email']",$email);
			if ($country ==="in" or $country ==="sg"  ){ 
				$this->fillFieldsxpath("//form[contains(@action,'job-apply')]//*[@id='edit-current-job']",$currentjob);
			}
			if ($country ==="in") {
				$this->selectFieldsxpath($currentsalary,"//form[contains(@action,'job-apply')]//*[@id='edit-current-salary']");
			} 
			$this->uploadLocalFile($browsecv,"//form[contains(@action,'job-apply')]//*[@id='edit-cv']");
			$this->fillFieldsxpath("//form[contains(@action,'job-apply')]//*[@id='edit-message']",$message);
			if ($bcreatalert === "1"){ 
				$this->getSession()->getPage()->checkField("edit-create-alert");
			}
			if ($country === "ie"){ 
				if ($bprivacy === "1"){
				Echo "entered";
					$this->getSession()->getPage()->checkField("edit-privacy-data-1");
					//$this->checkFieldxpath("edit-privacy-data-1");
					//$this->checkFieldxpath("edit-privacy-data-2");
				}
			}
        }
		//For Job Apply When Login
		elseif($form === "jobapply when login") {
			list($firstname,$lastname,$email,$currentjob,$currentsalary,$browsecv,$bupload,$message,$bcreatalert,$bprivacy)=preg_split("[,]",$para);
			$this->fillFieldsxpath("//form[contains(@action,'job-apply')]//*[@id='edit-firstname']",$firstname);
			$this->fillFieldsxpath("//form[contains(@action,'job-apply')]//*[@id='edit-lastname']",$lastname);
			$this->fillFieldsxpath("//form[contains(@action,'job-apply')]//*[@id='edit-email']",$email);
			if ($country ==="in" or $country ==="sg"){ 
				$this->fillFieldsxpath("//form[contains(@action,'job-apply')]//*[@id='edit-current-job']",$currentjob);
			}
			if ($country ==="in") {
				$this->selectFieldsxpath($currentsalary,"//form[contains(@action,'job-apply')]//*[@id='edit-current-salary']");
			}
			if ($this->existelementxpath("//*[@id='edit-use-uploaded']")){
				if ($bupload === "1") {
					$this->iSelectTheRadioButton('edit-use-uploaded');
					$this->uploadLocalFile($browsecv,"//form[contains(@action,'job-apply')]//*[@id='edit-cv']");
				}
			}
			$this->fillFieldsxpath("//form[contains(@action,'job-apply')]//*[@id='edit-message']",$message);
			if ($bcreatalert === "1"){ 
				$this->getSession()->getPage()->checkField("edit-create-alert");
			}
			if ($country === "au"){ 
				if ($bprivacy === "1"){
					$this->checkFieldxpath("edit-privacy-data-1");
					$this->checkFieldxpath("edit-privacy-data-2");
				}
			}
        }
				//For Submit CV
		elseif($form === "Submit CV")	{
			list($fname,$lname,$email,$comments,$title,$sal,$location_hk,$location_au,$location_sg,$location_in,$location_my,$location_nz,$location_uk,$location_ie,$location_us,$location_jp,$location_at,$sector,$jobtype,$cv,$check)=preg_split("[,]",$para);
			$this->getSession()->getPage()->fillField("edit-firstname",$fname);
			$this->iWaitForSeconds(2);
			$this->getSession()->getPage()->fillField("edit-lastname",$lname);
			$this->iWaitForSeconds(2);
			$this->getSession()->getPage()->fillField("edit-email",$email);
			$this->iWaitForSeconds(2);
			$this->getSession()->getPage()->fillField("edit-comment",$comments);
			$this->iWaitForSeconds(2);
			//Current Job Title only for SG and IN
			if($country ==="sg" or $country ==="in")	{
				$this->getSession()->getPage()->fillField("edit-current-job",$title);
				$this->iWaitForSeconds(2);
			}
			//Current Salary only for IN
			if($country ==="in")	{
				$this->getSession()->getPage()->selectFieldOption("edit-current-salary",$sal);
				$this->iWaitForSeconds(2);
			}
			$this->getSession()->getPage()->selectFieldOption("edit-sector",$sector);
			$this->iWaitForSeconds(2);
			$var='location_'.$country;
			$this->getSession()->getPage()->selectFieldOption("edit-location-cv",$$var);
			$this->iWaitForSeconds(2);
			$this->getSession()->getPage()->selectFieldOption("edit-job-type",$jobtype);
			$this->iWaitForSeconds(2);
			$this->uploadLocalFile($cv,"//input[@id='edit-cv']");
			//Checkboxs only for AU
			If($country ==="au")	{
				If($check ==="1")	{
					$this->getSession()->getPage()->checkField("edit-privacy-data-1");
					$this->getSession()->getPage()->checkField("edit-privacy-data-2");
				}
			}
		}
	}

//**********************************************************************************************************************************************************************************************//
//Purpose : This function covers entire search functionality scenarios while searching through keyword
//Created on : 21 May 2014
//Author : Sahil Mehta
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//
/**
 * @When /^I search jobs with Keywords "([^"]*)" and also filtering the search with salary location sector and sub-sector filters for Page site "([^"]*)"$/
 */
public function SearchWithKeyword($search,$pagesite)
	{
		//check for keywords passed if not throw exception
		if ($search === null or $search === "")	{
            throw new Exception('No keyword is mentioned to search for');
		}
		$keywords=preg_split("[,]",$search);
		$max=count($keywords);
		$i=0;
		//Searching with keyword on homepage with all the keywords mentioned along with salary filter
		while($i<$max)	{
			$this->FillIn($keywords[$i],"search","search jobs");
			// Page personnel site do not have salary filter
			if ($pagesite === "michaelpage"){
				$element = $this->getSession()->getPage()->findAll('xpath',"//*[@id='salary-select-wrapper']//*[@id='edit-field-job-salary-min']");
				foreach ($element as $item) {
					$values=preg_split("[\s]",(string)$item->getText());
					$salmax=count($values);
				}
				//select 1st value for min salary
				$this->selectFieldsxpath($values[1],"//*[@id='salary-select-wrapper']//*[@id='edit-field-job-salary-min']");
				//select 4th value for max salary
				$this->selectFieldsxpath($values[4],"//*[@id='salary-select-wrapper']//*[@id='edit-field-job-salary-max']");
			}
			$this->iPressButton("Search");
			$i++;
			$grabresult=$this->GrabTextWithXpath("//*[@class='pager pager-top']//*[@class='num-matching-jobs']");
			$searchresult=preg_split("[\s]",(string)$grabresult);
			if($searchresult[0] === "0")	{
				throw new Exception('I see 0 matching jobs for the search(es) mentioned');
			}
			$this->iWaitForSeconds(2);
			$this->iClickOnTheElementWithXPath("//*[@href]//span[contains(text(),'Home')]");
			$this->iWaitForSeconds(2);
		}

		//Search functionality with keyword and using filters present on job search result page
		$this->FillIn($keywords[0],"search","search jobs");
		// Page personnel site do not have salary filter
		if ($pagesite === "michaelpage"){
			//select 0 for min salary
			$this->selectFieldsxpath($values[0],"//*[@id='salary-select-wrapper']//*[@id='edit-field-job-salary-min']");
			//select highest value for max salary
			$this->selectFieldsxpath($values[$salmax-1],"//*[@id='salary-select-wrapper']//*[@id='edit-field-job-salary-max']");
		}
		$this->iPressButton("Search");
		$this->iWaitForSeconds(2);

		//Salary Filter on job search result page
		//select 0 for min salary
		//$this->selectFieldsxpath($values[0],"//*[@id='views-exposed-form-job-search-jobsearch-facet-filter']//*[@id='edit-field-job-salary-min']");
		//select highest value for max salary
		//$this->selectFieldsxpath($values[$salmax-1],"//*[@id='views-exposed-form-job-search-jobsearch-facet-filter']//*[@id='edit-field-job-salary-max']");
		//$this->iPressButton("Filter Salary");
		$this->iWaitForSeconds(2);

		//get the number of matching jobs
		$grabresult=$this->GrabTextWithXpath("//*[@class='pager pager-top']//*[@class='num-matching-jobs']");
		$searchresult=preg_split("[\s]",(string)$grabresult);
		//Grab initial count
		$fcount=$searchresult[0];
		$this->iWaitForSeconds(2);

		//click on 1st location on location filter to check the matching jobs have reduced
		$this->iClickOnTheElementWithXPath("//*[@id='facetapi-facet-search-apijob-search-block-field-job-locationparents-all']//li/a");
		$this->iWaitForSeconds(2);
		$grabresult=$this->GrabTextWithXpath("//*[@class='pager pager-top']//*[@class='num-matching-jobs']");
		$searchresult=preg_split("[\s]",(string)$grabresult);
		$loccount=$searchresult[0];
		if($loccount>$fcount)	{
			throw new Exception('Number of jobs filtered after location filtering is more than expected');
		}

		$this->iWaitForSeconds(2);
		//click on 1st sector on sector filter to check the matching jobs have reduced
		$this->iClickOnTheElementWithXPath("//*[contains(@class,' sector')]//li/a");
		$this->iWaitForSeconds(2);
		$grabresult=$this->GrabTextWithXpath("//*[@class='pager pager-top']//*[@class='num-matching-jobs']");
		$searchresult=preg_split("[\s]",(string)$grabresult);
		$seccount=$searchresult[0];
		if($seccount>$loccount)	{
			throw new Exception('Number of jobs filtered after sector filtering is more than expected');
		}

		$this->iWaitForSeconds(2);
		//click on 1st subsector on subsector filter to check the matching jobs have reduced(or remain same)
		$this->iClickOnTheElementWithXPath("//*[contains(@class,'subsector')]//li/a");
		$this->iWaitForSeconds(2);
		$grabresult=$this->GrabTextWithXpath("//*[@class='pager pager-top']//*[@class='num-matching-jobs']");
		$searchresult=preg_split("[\s]",(string)$grabresult);
		$subcount=$searchresult[0];
		if($subcount>$seccount)	{
			throw new Exception('Number of jobs filtered after subsector filtering is more than expected');
		}

		$this->iWaitForSeconds(2);
		//click on 1st contract type on job type filter to check the matching jobs have reduced(or remain same)
		$this->iClickOnTheElementWithXPath("//*[@id='facetapi-facet-search-apijob-search-block-field-job-contract-type']//li/a");
		$this->iWaitForSeconds(2);
		$grabresult=$this->GrabTextWithXpath("//*[@class='pager pager-top']//*[@class='num-matching-jobs']");
		$searchresult=preg_split("[\s]",(string)$grabresult);
		$concount=$searchresult[0];
		if($concount>$subcount)	{
			throw new Exception('Number of jobs filtered after job type filtering is more than expected');
		}
		
	}
	
//**********************************************************************************************************************************************************************************************//
//Purpose : This function grabs the search performed to verify on saved search and job alert and validate the search result through the saved search and alert created
//Pre-requisite : User should be on job search result page
//Created on : 13 June 2014
//Author : Sahil Mehta
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//
/**
 * @Then /^I verify and validate the saved search and job alert created$/
 */
public function VerifySavedSearchJobAlertWithKeyword()
	{
		//Grab the search result to compare the search or alert leads to same page
		$grabresult=$this->GrabTextWithXpath("//*[@class='pager pager-top']//*[@class='num-matching-jobs']");
		$searchresult=preg_split("[\s]",(string)$grabresult);
		$searchcount=$searchresult[0];
		//Grab the keyword and filters for comparing name of search saved and alert created
		//Run time keyword grab from search textbox
		$xkeyword=$this->getSession()->getPage()->find('xpath',"//form[@id='views-exposed-form-job-search-job-search']//input[@id='edit-search']");
		$keyword=$xkeyword->getValue();
		//Run time location selected grab
		$alocation=$this->GrabTextWithXpath("//*[@id='facetapi-facet-search-apijob-search-block-field-job-locationparents-all']//span[contains(text(),'Remove')]");
		$atextlocation=preg_split("[\s]",$alocation);
		$loccount=count($atextlocation);
		$maxcount=$loccount;
		//Run Time sector selected grab and text count 'e.g: "Remove England filter" -> count=3
		$asector=$this->GrabTextWithXpath("//*[contains(@class,' sector')]//span[contains(text(),'Remove')]");
		$atextsector=preg_split("[\s]",$asector);
		$seccount=count($atextsector);
			if($seccount>$maxcount){
				$maxcount=$seccount;
			}
		//Run Time sub-sector selected grab and text count
		$asubsector=$this->GrabTextWithXpath("//*[contains(@class,'subsector')]//span[contains(text(),'Remove')]");
		$atextsubsector=preg_split("[\s]",$asubsector);
		$subseccount=count($atextsubsector);
			if($subseccount>$maxcount){
				$maxcount=$subseccount;
			}
		//Run Time job type selected grab and text count
		$ajobtype=$this->GrabTextWithXpath("//*[@id='facetapi-facet-search-apijob-search-block-field-job-contract-type']//span[contains(text(),'Remove')]");
		$atextjobtype=preg_split("[\s]",$ajobtype);
		$typecount=count($atextjobtype);
			if($typecount>$maxcount){
				$maxcount=$typecount;
			}
		//Generate the name in the format of saved search and alert created
		$i=1;$location="";$sector="";$subsector="";$jobtype="";
		//Loop to grab only the name of the texts which needs to be grabbed e.g.: in Text "Remove England filter" only grab "England"
		while($i<$maxcount-1){
			
			if($i<$loccount-1){
				if ($atextlocation[$i] != "filter"){
					$location.=$atextlocation[$i]." ";
				}
			}
			if($i<$seccount-1){
				if ($atextsector[$i] != "filter"){
					$sector.=$atextsector[$i]." ";
				}
			}
			if($i<$subseccount-1){
				if ($atextsubsector[$i] != "filter"){
					$subsector.=$atextsubsector[$i]." ";
				}
			}
			if($i<$typecount-1){
				if ($atextjobtype[$i] != "filter"){
					$jobtype.=$atextjobtype[$i];
				}
			}
			$i++;
		}
		$title_search=$keyword." : ".$location.": ".$sector.": ".$subsector.": ".$jobtype;

		//Goto Mypage profile
		$this->iClickOnTheElementWithXPath("//a[@data-meganav='mega_menu_mypage']");
		$this->iWaitForSeconds(2);

		//Click on Manage your saved search
		$this->iClickOnTheElementWithXPath("//a[contains(text(),'Manage your saved searches')][not(contains(@class,'savesearch'))]");
		$this->iWaitForSeconds(2);
		//Check for the search saved and click on it
		$selement = $this->getSession()->getPage()->find('xpath',"//a[@title='Rerun search'][contains(text(),'$title_search')]");
		if($selement === null){
			throw new \InvalidArgumentException(sprintf('Could not find the saved search with title : "%s"', $title_search));
		}
		//Click on the saved search which has been captured if present
		$this->iClickOnTheElementWithXPath("//a[@title='Rerun search'][contains(text(),'$title_search')]");
		$this->iWaitForSeconds(2);
		//Verify same results are obtained
		$grabsavedresult=$this->GrabTextWithXpath("//*[@class='pager pager-top']//*[@class='num-matching-jobs']");
		$savedresult=preg_split("[\s]",(string)$grabsavedresult);
		$savedcount=$savedresult[0];
		if($savedcount!=$searchcount){
			throw new Exception('The saved search navigation did not obtain same results as expected');
		}

		//Goto Mypage profile
		$this->iClickOnTheElementWithXPath("//a[@data-meganav='mega_menu_mypage']");
		$this->iWaitForSeconds(2);

		//Click on Manage your job alerts
		$this->iClickOnTheElementWithXPath("//a[contains(text(),'Manage your job alerts')]");
		$this->iWaitForSeconds(2);
		//Check for the alert created and click on it
		$jelement = $this->getSession()->getPage()->find('xpath',"//a[@title='Rerun search'][contains(text(),'$title_search')]");
		if($jelement === null){
			throw new \InvalidArgumentException(sprintf('Could not find the job alert created with title : "%s"', $title_search));
		}
		$this->iClickOnTheElementWithXPath("//a[@title='Rerun search'][contains(text(),'$title_search')]");
		$this->iWaitForSeconds(2);
		//Verify same results are obtained
		$grabalertresult=$this->GrabTextWithXpath("//*[@class='pager pager-top']//*[@class='num-matching-jobs']");
		$alertresult=preg_split("[\s]",(string)$grabalertresult);
		$alertcount=$alertresult[0];
		if($alertcount!=$searchcount){
			throw new Exception('The job alert navigation did not obtain same results as expected');
		}

	}

//**********************************************************************************************************************************************************************************************//
//Purpose : This function covers entire search functionality scenarios while searching through browse for jobs (in progress)
//Created on :
//Author :
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//
/**
 * @When /^I search using Browse jobs "([^"]*)" and also filtering the search with sector sub-sector and location$/
 */
public function SearchWithBrowseJobs($search)
	{
		//check for keywords passed if not throw exception
		if ($search === null or $search === "")	{
            throw new Exception('No sector is mentioned to search from Browse your jobs');
		}
		//Search functionality with keyword and using filters present on job search result page
		$this->FillIn($keywords[0],"search","search jobs");
		//select 0 for min salary
		$this->selectFieldsxpath($values[0],"//*[@id='salary-select-wrapper']//*[@id='edit-field-job-salary-min']");
		//select highest value for max salary
		$this->selectFieldsxpath($values[$salmax-1],"//*[@id='salary-select-wrapper']//*[@id='edit-field-job-salary-max']");
		$this->iPressButton("Search");
		$this->iWaitForSeconds(2);

		//Salary Filter on job search result page
		//select 0 for min salary
		//$this->selectFieldsxpath($values[0],"//*[@id='views-exposed-form-job-search-jobsearch-facet-filter']//*[@id='edit-field-job-salary-min']");
		//select highest value for max salary
		//$this->selectFieldsxpath($values[$salmax-1],"//*[@id='views-exposed-form-job-search-jobsearch-facet-filter']//*[@id='edit-field-job-salary-max']");
		//$this->iPressButton("Filter Salary");
		$this->iWaitForSeconds(2);

		//get the number of matching jobs
		$searchresult=$this->GrabTextWithXpath("//*[@class='pager pager-top']//*[@class='num-matching-jobs']");
		//Grab initial count
		$fcount=$searchresult[0];
		$this->iWaitForSeconds(2);

		//click on 1st location on location filter to check the matching jobs have reduced
		$this->iClickOnTheElementWithXPath("//*[@id='facetapi-facet-search-apijob-search-block-field-job-locationparents-all']//li/a");
		$this->iWaitForSeconds(2);
		$searchresult=$this->GrabTextWithXpath("//*[@class='pager pager-top']//*[@class='num-matching-jobs']");
		$loccount=$searchresult[0];
		if($loccount>$fcount)	{
			throw new Exception('Number of jobs filtered after location filtering is more than expected');
		}

		$this->iWaitForSeconds(2);
		//click on 1st sector on sector filter to check the matching jobs have reduced
		$this->iClickOnTheElementWithXPath("//*[contains(@class,' sector')]//li/a");
		$this->iWaitForSeconds(2);
		$searchresult=$this->GrabTextWithXpath("//*[@class='pager pager-top']//*[@class='num-matching-jobs']");
		$seccount=$searchresult[0];
		if($seccount>$loccount)	{
			throw new Exception('Number of jobs filtered after sector filtering is more than expected');
		}

		$this->iWaitForSeconds(2);
		//click on 1st subsector on subsector filter to check the matching jobs have reduced(or remain same)
		$this->iClickOnTheElementWithXPath("//*[contains(@class,'subsector')]//li/a");
		$this->iWaitForSeconds(2);
		$searchresult=$this->GrabTextWithXpath("//*[@class='pager pager-top']//*[@class='num-matching-jobs']");
		$subcount=$searchresult[0];
		if($subcount>$seccount)	{
			throw new Exception('Number of jobs filtered after subsector filtering is more than expected');
		}

		$this->iWaitForSeconds(2);
		//click on 1st contract type on job type filter to check the matching jobs have reduced(or remain same)
		$this->iClickOnTheElementWithXPath("//*[@id='facetapi-facet-search-apijob-search-block-field-job-contract-type']//li/a");
		$this->iWaitForSeconds(2);
		$searchresult=$this->GrabTextWithXpath("//*[@class='pager pager-top']//*[@class='num-matching-jobs']");
		$concount=$searchresult[0];
		if($concount>$subcount)	{
			throw new Exception('Number of jobs filtered after job type filtering is more than expected');
		}

	}
	
//************************************************************************************************************************************************
//Purpose : This function is to delete the CV
//Created on : 26/8/2014
//Author : Aniket Kharade
//Improvements/Modifications/Changes history|Reason                                                            |Date                    |Done By             |
//
//****************************************************************************************************
/**
 * @When /^I check existing CV$/
 */
public function CheckExistingCV() 
	{
			$cvPresent=$this->existelementxpath("//form[@id='mp-mypage-cv-select-form']"); //Check whether the Element is present.
			if ($cvPresent!= null)	{
				$existingCV=$this->iCountChild("//form[@id='mp-mypage-cv-select-form']//tbody/tr"); //Returns the count of Element.
				for ($i=$existingCV; $i>=1; $i--) {
				    $this->iClickOnTheElementWithXPath("//tr[$i]//*[@class='delete-cv']");
					$this->iWaitForSeconds(5);
					$this->iClick("//*[@value='Confirm']");
					$this->iWaitForSeconds(2);				  
				}
			} 
	}
//************************************************************************************************************************************************
//Purpose : This function is for Salary Employment forecast report.
//Created on : 22/12/2014
//Author : Aniket Kharade
//Improvements/Modifications/Changes history|Reason                                                            |Date                    |Done By             |
//
//****************************************************************************************************


 /**
  * @Given /^I Fill "([^"]*)" Url for country "([^"]*)" and parameters "([^"]*)"$/
  */

public function iFillUrlForCountryAndParameters($Url, $country, $para)
{
    if($Url==="salary-centre" or $Url==="salary-survey" )
		{
				list($sector,$subsector,$location)=preg_split("[,]",$para);
				$this->getSession()->getPage()->selectFieldOption("edit-select-sector",$sector); 
				$this->iWaitForSeconds(5);
				if(empty($sector)){
				$var="edit-select-subsector";
				$this->getSession()->getPage()->selectFieldOption($var,$subsector);
				}
				else{
				$newvar="edit-select-subsector--2";
				$this->getSession()->getPage()->selectFieldOption($newvar,$subsector);
				}
				//$old="edit-submitted-logistics-locations";
			    /* $new = str_replace("edit-select-subsector",$genID,$newvar);*/
				
				$this->iWaitForSeconds(5);
				$this->getSession()->getPage()->selectFieldOption("edit-select-location--3",$location);
				
		}
		
}

//************************************************************************************************************************************************
//Purpose : This function is for Navigating to Salary Employment forecast report.
//Created on : 8/1/2015
//Author : Aniket Kharade
//Improvements/Modifications/Changes history|Reason                                                            |Date                    |Done By             |
//
//****************************************************************************************************

/**
 * @Given /^I navigate the URL with parameters "([^"]*)"$/   
 */

 
 public function iNavigateTheUrlWithParameters($sector,$subsector,$location)
//public function iSelectAndNavigate($sector,$subsector,$location)
{
  // $base="http://wwwuat.michaelpage.com.au/salary-survey/Marketing/Healthcare/NSW/all";
   $session=$this->getSession();
   $detailurl=$session->getCurrentUrl();
   echo $detailurl;
   list($https,$dummy,$domain,$dummy_Url,$sec,$sub,$loc)=preg_split("[/]",$detailurl);
  // $splitUrl = split ("/\//", $base); 
			//$externalapply = $domain."/"."job-apply-external"."/".$ref."/".$refnum;
		//ereg($string, '[^a-zA-Z0-9_-]')
		//rawurldecode($sec);
		//echo $sec;
		
		if($sec===$sector and $sub===$subsector and $loc===$location)
		{
		  echo "The Url is redirectd to target Url";
		}
   
    
		
}

//**********************************************************************************************************************************************************************************************//
//Purpose : This function is for checking a part of the url is as expected
//Created on : 09 May 2014
//Author : Sahil Mehta
//Improvements/Modifications/Changes history|Reason				|Date		|Done By	|
//
//**********************************************************************************************************************************************************************************************//
  
/**
* @Given /^I navigate url "([^"]*)" with parameters "([^"]*)"$/
*/
public function iNavigateurl($url,$parameter)
  {
	list($sector,$subsector,$location)=preg_split("[,]",$parameter);
	$session=$this->getSession();
	$node = $this->getSession()->getCurrentUrl();
	if (null === $node ) {
			throw new \InvalidArgumentException(sprintf('Could not get url'));
		}

	if (strpos($node,"salary-survey/".$sector."/".$subsector."/".$location."/all") == False) 
	{
		throw new \InvalidArgumentException(sprintf('Could not get Exact Url: "%s"', $node));
	}

  }
//END OF DRIVER FUNCTIONS FOR PAGES HAVING XPATHS MENTIONED------------------------------------------------------

//
// Place your definition and hook methods here:
//
//    /**
//     * @Given /^I have done something with "([^"]*)"$/
//     */
//    public function iHaveDoneSomethingWith($argument)
//    {
//        doSomethingWith($argument);
//    }
//
}

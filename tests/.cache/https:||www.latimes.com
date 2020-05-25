
<!DOCTYPE html>
<html class="HomePage" lang="en-US">
    <head>
    <meta charset="UTF-8">

    <style data-cssvarsponyfill="true">
        :root {
        --siteBgColor: #ffffff;
        --siteInverseBgColor: #000000;

        --headerBgColor: #ffffff;
        --headerBgColorInverse: #000000;
        --headerBorderColor: #e6e6e6;
        --headerBorderColorInverse: #858585;
        --headerTextColor: #333333;
        --headerTextColorInverse: #ffffff;
        --headerMenuBgColor: #ffffff;
        --headerMenuTextColor: #333333;

        --secondaryHeaderBgColor: #ffffff;
        --secondaryHeaderTextColor: #333333;

        --sectionHeaderBgColor: #ffffff;
        --sectionHeaderBorderColor: #e6e6e6;
        --sectionHeaderTextColor: #333333;
        --sectionNavTextColor: #333333;
        --sectionNavDropdownColor: #333333;
        --sectionNavCurrentIndicatorColor: #ff6859;

        --footerBgColor: #000000;
        --footerTextColor: #ffffff;

        --primaryTextColor: #000000;
        --primaryTextColorInverse: #ffffff;
        --secondaryTextColor: #666666;
        --secondaryTextColorInverse: #cccccc;
        --tertiaryTextColor: #999999;
        --tertiaryTextColorInverse: #cccccc;

        --listBorderColor: #030202;
        --gridBorderColor: #e6e6e6;

        --buttonBgColor: #ffffff;
        --buttonTextColor: #333333;
        --inverseButtonBgColor: #030202;
        --tagButtonBgColor: #666666;
        --tagButtonTextColor: #ffffff;

        --breakingBgColor: #e12327;
        --breakingTextColor: #ffffff;

        --sponsoredBgColor: #cccccc;
        --sponsoredTextColor: #333333;

        --liveBannerBgColor: #333333;
        --liveBannerTextColor: #ffffff;

        --brandColor: #ff6859;

        --secondaryColor1: #858585;
        --secondaryColor2: #cccccc;
        --secondaryColor3: #e6e6e6;
        --secondaryColor4: #f5f5f5;
        --secondaryColor5: #ffffff;
        --secondaryColor6: #666666;
        --secondaryColor7: #333333;
        --secondaryColor8: #030202;
        --primaryBodyLinkColor: #087da1;

        --primaryHeadlineFont: KisFBDisplay;
        --secondaryHeadlineFont: BentonGothic;
        --tertiaryHeadlineFont: FranklinGothic;
        --sectionHeaderFont: KisFBDisplay;
        --bodyFont: Georgia;
        --primaryRecipeHeadlineFont: BentonGothicCond-Black;
        }
    </style>

    

    <meta property="og:url" content="https://www.latimes.com/">

    <meta property="og:image" content="https://ca-times.brightspotcdn.com/dims4/default/e2816d0/2147483647/strip/true/crop/1200x630+0+0/resize/1200x630!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F5b%2F78%2F7c3e41e74e4b986d23923ee121b2%2Flat-logo-dark-full.jpg">

    
    <meta property="og:image:url" content="https://ca-times.brightspotcdn.com/dims4/default/e2816d0/2147483647/strip/true/crop/1200x630+0+0/resize/1200x630!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F5b%2F78%2F7c3e41e74e4b986d23923ee121b2%2Flat-logo-dark-full.jpg">
    
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:image:type" content="image/jpeg">
    
    <meta property="og:image:alt" content="Los Angeles Times">
    


    <meta property="og:site_name" content="Los Angeles Times">



    <meta property="og:type" content="website">

    
    <meta name="twitter:card" content="summary_large_image"/>
    
    
    
    
    

    
    
    <meta name="twitter:site" content="@latimes"/>
    
    
    

    <meta property="fb:app_id" content="119932621434123">

    <meta property="fb:pages" content="5863113009">

<link rel="preconnect" href="//fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="//securepubads.g.doubleclick.net">
<link rel="preconnect" href="//www.google-analytics.com">
<link rel="preconnect" href="//static.chartbeat.com">
<link rel="preconnect" href="//www.googletagservices.com">
<link rel="preconnect" href="//js-sec.indexww.com">
<link rel="preconnect" href="//as-sec.casalemedia.com">
<link rel="preconnect" href="//as.casalemedia.com">
<link rel="preconnect" href="//c.amazon-adsystem.com" crossorigin>
<link rel="preconnect" href="//aax.amazon-adsystem.com">
<link rel="preconnect" href="//s.ntv.io">
<link rel="preconnect" href="//a.teads.tv">
<link rel="preconnect" href="//t.teads.tv">
<link rel="preconnect" href="//ssor.platform.californiatimes.com">
<link rel="preconnect" href="//dss.platform.californiatimes.com">
<link rel="preconnect" href="//b.scorecardresearch.com">
<link rel="preconnect" href="//pubads.g.doubleclick.net">
<link rel="preconnect" href="//tpc.googlesyndication.com">
<link rel="preconnect" href="//ca-times.brightspotcdn.com" crossorigin>
<link rel="preconnect" href="//ping.chartbeat.net">
<link rel="preconnect" href="//connect.facebook.net">
<link rel="preconnect" href="//staticxx.facebook.com">
<link rel="preconnect" href="//activate.platform.californiatimes.com">

    <link data-cssvarsponyfill="true" class="Webpack-css" rel="stylesheet" href="https://ca-times.brightspotcdn.com/resource/0000016e-6bb5-d505-abef-fbb7e4420000/styleguide/All.min.86dec35d776fb8cbb478de32da58fc57.gz.css">

    <style>/* Whole bar and logo */
@media only screen and (min-width: 548px) {
    .Page-header-end .dss-header {
        margin-right: -10px !important;
    }

    .Page-header-logo img {
        width: 142px !important;
    }
}

@media only screen and (min-width: 648px) {
    .Page-header-logo img {
        width: 160px !important;
    }
}

@media only screen and (min-width: 768px) {
    .Page-header-end .dss-header {
        margin-right: 0px !important;
    }

    .Page-header-logo img {
        width: 265px !important;
    }
}


/* Login Button */
.bar-dss [data-reg-handler=signInHandler] {
    border: 1px solid #e6e6e6 !important;
    color: #333333 !important;
    height: 30px !important;
    line-height: 30px !important;
    margin-left: 0px !important;
    min-width: 0 !important;
    padding: 0 5px 0 !important;
}

.GalleryPage .bar-dss [data-reg-handler=signInHandler] {
    border: 1px solid #858585 !important;
    color: white !important;
}

@media only screen and (min-width: 548px) {
    .bar-dss [data-reg-handler=signInHandler] {
        margin-left: 10px !important;
    }

    .bar-dss [data-reg-role=button_tablet] .met-flyout a {
        width: 78px !important;
    }
}

@media only screen and (min-width: 648px) {
    .bar-dss [data-reg-role=button_tablet] .met-flyout a {
        width: 88px !important;
    }
}

@media only screen and (min-width: 768px) {
    .bar-dss [data-reg-handler=signInHandler] {
        height: 40px !important;
        line-height: 40px !important;

        padding: 0px 10px !important;
    }

    .bar-dss [data-reg-handler=signInHandler]:after {
        font-size: 13px !important;
        line-height: 40px !important;
    }
}

@media only screen and (min-width: 1024px) {
    .bar-dss [data-reg-handler=signInHandler] {
        margin-left: 15px !important;
        padding: 0px 15px !important;
    }
}



/* Profile Button */
.bar-dss [data-reg-handler=toggleNavigation] {
    padding: 0 15px !important;
    border: 1px solid #e6e6e6 !important;
    height: 30px !important;
    background-size: 13px !important;
    background-position: 8px !important;
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAflBMVEUBAAL///8AAACDg4P29vbHx8ff39+QkJD7+/tycnKjo6Py8vLp6enj4+PS0tLv7++urq61tbXa2tpDQ0PDw8O7u7tWVlZoaGgjIyNjY2N6enqLi4uCgoLV1dUcHByXl5cyMjJQUFCfn59AQEEtLS0MDAweHh4XFhdlZWY7OzxPcQTMAAAI0ElEQVR4nO3d53bjKhAAYEzk7shyibudOHHizfu/4ILkooIKw8AccTL/9m6y0ncl0RlYx/dg1DdgPf6E7Y8/YfvDmTDodWejz/7+Zd//HM3CXuDqwg6EgzA6LHgxFocoHNi/vG1hd/91F7F0PJj7ruU7sCkMonORxorQ1czmK2tPuNzW6NLKrb0naUk43TfkPZH9qZ1bsSKcDHV4D+S6Z+NmLAghvrtxgn876MIA6LsZD+iFDrbwE+67GUfId4QrnF+MfInxF/dzRBXujX2JsY95U4jC3gYFKIkfiCUOnjBC8iXGGdp9oQmHiEBJ3GHdGJIwWKACJXGBVG/gCCcM1xcbrzgfI4rwiPwAb0T+inFzGMLQClASMWpGBKEtIBLRXDi3BpRE82/RWPhqESiJxr1GU+HYKlAQN6aDVabCi12gIC5ohSvbQEEcUgr79oHMtMdoJOxa/gjvxDmVMHACFMQfKqGDj/BGNPkUDYQzR49QvqchhXDgDCj7GRTCoTugIMKHbsBCm81RhRDeQAULv1wCBXHrWvjmFiiI0MIGKtw4F0Lbp0DhzDVQfInAKUag8OpcyPiXS+HSPVAQYc1TmHBBIly7E/ac1oUPIR87E75QAAUR1FEECUkeoRyzcSUkKWcYtCsMEa6JhIzv3QhddptyQshrChB2qYCCCJirAQiJStJYCChNAcITofDsQjgh+wxlaepC6LxnmBHq1xf6QsLPEPQh6gvPpEL9kVN9IeFnKIS/9oUTSiCkqNEWEtb3MVG7ztcWRsRC7dEabeGeWBhZFzodzFcItYf3tYWklYUQvlgXWl+aUCPUHo7SFv4QC7WHvrWFhD2LWPhhXUgw2p0RanfzWyc8WRdSv6X2hdQljfbKE22h84nDnND+d/hLLNTuPrWuTbOyLqRul2p38lvXt9Ae2NcWjoiF2kNRrevj2+8B97wfxSAea3MwEtX58H00kba6AGza0xeSFqb6A1EAodtllzkgYCMUYP7Q+9k1dwvYFULAKlOAkHDUG/AZQoR0k8CgnWyQ9TRkXUTQKlqI8J1MCFnYBhHa3VRZAQRttwSt3HO8Tv8hPENuFiQkKk35mzMhzco2DlvPDPstkqEM/u5QOCV4iJzDEmUAdyMQdKH4AXarQKH7dg14Zz50V5Dzhwh9hGCh6y8R+hUa7M5zXJwCC1ITods6UX/a0FzodPsa50sCoctZKPgOUiOhu8IGXsyYCd01wGFNbgRhZ+soa4RRdhMj4cBCEjMFEF6OGgudbEQ0TWpmmIHHfm4MbvQRmgut5+Dh8MYMkrCzs5wJyzhDpHm+NquD/PqLSywIbbZtYKNr2cDIm2iNiAHEyX25tZT70qA1+gyc/KU7C0SsNLRIOWjf0Ynm1cQtsPIIv6Fn2TWs6B+Blim5d0XNBX1CS1uOl+16gFfeiDIG73gWo/7hMfvnmVlO/acvn837CJjcfgRc2L0UEsWNVwhEzle5HCYh5xf4GSZQ4WQVHxGTv3Bk+hjF7+cfWDc5jAaazgwoPCSSYnb4YGdiFL+7y3+B0e1K+nu6kgAJu993BS+u2Z2foUb5pAq70ffPS11BrypAGPxLCVRNq3AFMUpfMSfbNnOtNWDMDZJxIHv7/FKcFOppH8Uifn5YHK2YZPcCckg7QFcYFGs95YD0+P3aHCl+8udT8XiWimttdR+jplCZV5erh/u660ZnPskfGipTBioPlNDOZaonLDlmRTwC5WUH3cO16lyy+O9Oh66yAROeyi6mtyFBRzguP8SCl05gTqLhpXC23P0/XHZRSTU3KO+QaR59oSGsPCFAlOXl00PjMDqsPzJHA/6uX2Zhef615Xf1xTRSnDQXjmq+KfG/tq4/EExee/Pe66TuEcy/aq/VvKXaWNjgHBmkU8Ve100u1XgAoKFw0OgcGXWlphfS1+hS54YdrGbCadO9seLu/pn0XefbxrUo3zRLo9hIqLM8Xza+oFPSb1pN2oZTNk2EmsesxMc16r+sPb1DIeMLHev/2SbCYtupifHS10laNd9fAK31Rpl364WwUbS40jt0m1TNwXKn+/SeV6n/IGqF8BnCGPmxi6qe5TEaftSdN2tIrBMaToEmDZjNcB8tw8k0SAr4QTCdhG/RfvijOCgYnVgjRBnoTTXWrpvL5pr6M8Y/XvMtVgtxDyFBlaX+1eruVKXQznlq2FGzoa1KSLWvQjeqF9dWCF0dI2Me/FrRRq0Qkm741YuqDVHlQkdLunCiYmFYqbDfmndURsWxV2VC/cYobZTXGSVCylS6sCjNul8iJM47B4my8y/UQuIkNLAoGUdVCt2dxoUZJS1UlbB9H2ES6k9RJSTaImoeynV+CiHZRmbjUA4UF4VtfUdlqLYtFIWtfUdlKN7TgpA405VhFJdOFIQU+18xg/N8Ryov/NduoGInZk5o7xRxV1EY08gJW9gezUd+6XRWSJxwHSXyI6gZId0pQJiRS+KaEbo4hNpBZFs2aWF7BteqI5svKy0kTtyJF5lBm5TQl0eYe4gpoTePMPsQmYePUAi/VcL2dgsVkSpOn0KPHmGmTnwIfWjOpOI5KvUQetAiTcezK3wXhn4BU8uJ7sJWzTQ1icf48E049qqckfGo9W/Cdo/OKOO+rP8mbNF8b9O4lzWJkDI3sK24r19IhB41SZ9xa5wmwm8vhYunsB0rg3SD88lD6OVLen9NYyHx6Ti2IilNpfDVT+BtJkoKPz0VJpW+FBIf/2Mv4m0nzK/hi2zwayIkPjnGYsRdKOZtXSFDDtcI4cJj4VAK/ZiOUYfsJDLvxi8yIRpuzN/aUAZfCmHrZ+6rgveF0NNGaRL83GH+1vcy+KnD5j4D5XJF5jLhMUHwkHkyd18WfMYs566kDr5n3nadkuBbRnxGs+3gJ+Z1ZSELU+Z1hS/zErBWbq1oHnzI/O3hx8G7zOcOcDyyz1q/7rkq5PwT63SmkIQNLQiZumJ6G9UfcS/j+zlv0ekcR/3Di09x6I+OufU03safsP3xJ2x/+C/8D+HTjCDk03JDAAAAAElFTkSuQmCC) !important;
}

.GalleryPage .bar-dss [data-reg-handler=toggleNavigation] {
    border: 1px solid #858585 !important;
    color: white !important;
}

.bar-dss [data-reg-handler=toggleNavigation]:before {
    display: none !important;
}

.bar-dss .met-flyout.met-rule-599 {
    top: 58px !important;
    right: 54px !important;
}


@media only screen and (min-width: 768px) {
    .bar-dss [data-reg-handler=toggleNavigation] {
        padding: 0 20px !important;
        height: 40px !important;
        background-size: 15px !important;
        background-position: 13px !important;
        margin-left: 10px !important;
    }
}




/* Subscribe Buttons */
.bar-dss [data-reg-role^=button] .met-flyout a {
    padding: 5px 0  !important;
    height: 36px  !important;
    position: relative !important;
    top: 1px !important;
}

.bar-dss [data-reg-role=button_desktop] {
    display: none !important;
}

.bar-dss [data-reg-role=button_tablet] {
    display: none !important;
}

@media only screen and (min-width: 548px) {
    .bar-dss [data-reg-role=button_tablet] {
        display: block !important;
    }
}

@media only screen and (min-width: 1280px) {
    .bar-dss [data-reg-role=button_tablet] {
        display: none !important;
    }

    .bar-dss [data-reg-role=button_desktop] {
        display: block !important;
    }
}</style>
<style>.Page-footer-content .RichTextModule .Link {
    color: white;
    word-break: keep-all;
    font-family: BentonGothic,Arial,Helvetica,sans-serif;
    font-size: 1.4rem;
    font-weight: 500;
    line-height: 1;
    text-decoration: none;
}

.Page-footer-content .RichTextModule .Link:hover, 
.Page-footer-content .RichTextModule .Link:focus {
    color: #cccccc;
}</style>
<style>.SectionPage .SectionPage-topContainer {
    z-index: 15;
}</style>
<style>.GoogleDfpAd-wrapper[data-hide-ad=true] {
    height: auto;
    margin: auto;
    overflow: auto;
}</style>
<style>body div.teads-inread div.teads-ui-components-label {
    color: #666 !important;
}

body div.teads-inread div.teads-ui-components-credits a {
    color: #666 !important;
}

body div.teads-inread div.teads-ui-components-credits span.teads-ui-components-credits-colored {
    color: #79bbe9!important;
}</style>
<style>@media only screen and (min-width: 1024px) {
    .ArticlePage .Page-above, .StoryStackPage .Page-above {
    	margin-left: 140px;
    	margin-right: 140px;
        background: none;
        border-bottom: none;
	}

    .ArticlePage .Page-above .ListJ {
        background: white;
        margin-left: -140px;
        margin-right: -140px;
        width: calc(100% + 280px);
    }
    
    .ArticlePage .Page-above .ListP {
        border-bottom: 1px solid #e6e6e6;
    	max-width: 1200px;
    	margin: 0 auto;
    }
}</style>
<style>.StoryStackPage .Page-above {
    display: block;
}</style>
<style>.ButtonSolid,
.ButtonTransparent,
.Form button {
  background-color: var(--primaryColor);
  color: #ffffff;
  font-size: 10px;
  line-height: 1;
  letter-spacing: 0.2px;
  padding: 10px 0 10px 0;
  text-align: center;
  cursor: pointer;
  display: inline-block;
  transition: all 0.3s ease;
}
.ButtonTransparent,
.Form button {
  background-color: transparent;
  color: var(--primaryColor);
  border: 1px solid var(--primaryColor);
  font-size: 14px;
  line-height: 1;
  letter-spacing: normal;
  padding: 12px 40px;
  text-align: center;
  font-weight: 500;
}
.ButtonTransparent:hover,
.Form button:hover {
  background-color: var(--primaryColor);
  color: #ffffff;
}
.Form {
  margin: 0 auto;
  max-width: 1200px;
  width: 100%;
  padding: 20px;
}
.Form fieldset {
  border: 0;
  margin: 0;
  padding: 0;
}
@media only screen and (min-width: 768px) {
  .Form {
    padding: 40px;
  }
}
.Form-title {
  font-size: calc(22 / 10 * 1rem);
  font-weight: 700;
}
.Form legend {
  font-size: calc(22 / 10 * 1rem);
  font-weight: 400;
}
@media only screen and (min-width: 1024px) {
  .Form-items-item {
    padding-top: 20px;
  }
}
.Form select::-ms-expand {
  display: none;
}
.Form select {
  -webkit-appearance: none;
  appearance: none;
  padding: 5px 50px 5px 10px;
  background-color: #ffffff;
  box-shadow: inset 0 1px 3px 0 rgba(0, 0, 0, 0.15);
  border: solid 1px rgba(204, 204, 204, 0.4);
  margin: 5px;
  width: auto;
}
.Form .Input,
.Form .CaptchaInput,
.Form .CheckboxInput,
.Form .TextArea,
.Form .TextInput,
.Form .EmailInput,
.Form .PhoneNumberInput,
.Form .RadioInput,
.Form .PasswordInput,
.Form .FileInput,
.Form .Select {
  text-align: left;
  padding-top: 0;
  font-size: calc(1.2rem);
  line-height: 1.29;
  color: var(--primaryTextColor);
  padding-bottom: 10px;
}
.Form .Input-label,
.Form .CaptchaInput-label,
.Form .CheckboxInput-label,
.Form .TextArea-label,
.Form .TextInput-label,
.Form .EmailInput-label,
.Form .PhoneNumberInput-label,
.Form .RadioInput-label,
.Form .PasswordInput-label,
.Form .FileInput-label,
.Form .Select-label {
  color: var(--primaryTextColor);
  display: block;
  font-weight: 500;
  font-size: calc(14 / 10 * 1rem);
  padding: 0;
}
.Form .Input-input,
.Form .CaptchaInput-input,
.Form .CheckboxInput-input,
.Form .TextArea-input,
.Form .TextInput-input,
.Form .EmailInput-input,
.Form .PhoneNumberInput-input,
.Form .RadioInput-input,
.Form .PasswordInput-input,
.Form .FileInput-input,
.Form .Select-input {
  background: #f5f5f5;
  border: 0;
  box-shadow: none;
  color: #333333;
  display: block;
  line-height: 1.7;
  font-size: calc(16 / 10 * 1rem);
  font-weight: 300;
  margin: 5px 0 0 0;
  padding: 0 15px;
  width: 100%;
}
@media only screen and (min-width: 768px) {
  .Form .Input-input,
  .Form .CaptchaInput-input,
  .Form .CheckboxInput-input,
  .Form .TextArea-input,
  .Form .TextInput-input,
  .Form .EmailInput-input,
  .Form .PhoneNumberInput-input,
  .Form .RadioInput-input,
  .Form .PasswordInput-input,
  .Form .FileInput-input,
  .Form .Select-input {
    font-size: calc(18 / 10 * 1rem);
  }
}
.Form .Input-description,
.Form .CaptchaInput-description,
.Form .CheckboxInput-description,
.Form .TextArea-description,
.Form .TextInput-description,
.Form .EmailInput-description,
.Form .PhoneNumberInput-description,
.Form .RadioInput-description,
.Form .PasswordInput-description,
.Form .FileInput-description,
.Form .Select-description {
  font-size: calc(10 / 10 * 1rem);
  font-weight: 300;
  line-height: 22px;
}
.Form .CheckboxInput,
.Form .RadioInput {
  position: relative;
}
.Form .CheckboxInput-errors,
.Form .RadioInput-errors {
  display: none;
}
.Form .CheckboxInput-label,
.Form .RadioInput-label {
  padding-left: 20px;
}
.Form .CheckboxInput input,
.Form .RadioInput input {
  position: absolute;
  left: 0;
  top: -1px;
  width: unset;
  box-shadow: none;
  height: unset;
}
.Form .FileInput-input {
  background: none;
  font-size: calc(10 / 10 * 1rem);
  padding: 0;
}
.Form-buttons {
  text-align: center;
}
.Form button {
  margin-top: 30px;
}
@media only screen and (min-width: 1024px) {
  .Form .Input-label,
  .Form .CaptchaInput-label,
  .Form .TextInput-label,
  .Form .EmailInput-label,
  .Form .PhoneNumberInput-label,
  .Form .FileInput-label,
  .Form .TextArea-label,
  .Form .PasswordInput-label,
  .Form .Select-label {
    font-size: calc(18 / 10 * 1rem);
    line-height: 40px;
  }
  .Form .Input-input,
  .Form .CaptchaInput-input,
  .Form .TextInput-input,
  .Form .EmailInput-input,
  .Form .PhoneNumberInput-input,
  .Form .FileInput-input,
  .Form .TextArea-input,
  .Form .PasswordInput-input,
  .Form .Select-input {
    margin: 0;
  }
}
</style>


    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5"><title>News from California, the nation and world  - Los Angeles Times</title><meta name="description" content="The L.A. Times is a leading source of breaking news, entertainment, sports, politics, and more for Southern California and the world."><link rel="canonical" href="https://www.latimes.com/"><meta name="brightspot.contentId" content="00000163-01e2-d9e5-adef-33e21dfa0000"><link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png"><link rel="icon" type="image/png" href="/favicon-32x32.png"><link rel="icon" type="image/png" href="/favicon-16x16.png">
    <link type="application/rss+xml" rel="alternate" title="News from California, the nation and world " href="https://www.latimes.com/index.rss">
    <script id="head-dl">var dataLayer = {"urlSlug":"","rootId":"","bspContentUuid":"00000163-01e2-d9e5-adef-33e21dfa0000","pageTitle":"News from California, the nation and world  - Los Angeles Times","bspContentType":"homepage","publishDate":"04-26-2018 05:16","adUnit":"GoogleDfp:/21787098806/web.latimes/homepage","isAccessibleForFree":false,"pageName":"lat:homepage:home.","platform":"22","url":"https://www.latimes.com/","sectionFullPath":"homepage","sitePath":"/","sectionName":"homepage","site":"latimes","ownerSite":"latimes","domain":"www.latimes.com","pageTypeCode":"home","permalink":"https://www.latimes.com/"};</script>
    <script type="application/javascript">var _lb = 1;</script>
<script src="https://activate.platform.californiatimes.com/caltimes/latimes/Bootstrap.js" async></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" defer></script>
<script src="//ssor.platform.californiatimes.com/reg/tribune/latspot.min.js" defer></script>
<script src="//dss.platform.californiatimes.com/meter/latspot.min.js" defer></script>
<script type="application/ld+json">{"@context":"http://schema.org","@type":"WebPage","url":"https://www.latimes.com/","description":"The L.A. Times is a leading source of breaking news, entertainment, sports, politics, and more for Southern California and the world.","publisher":{"@type":"Organization","name":"Los Angeles Times","logo":{"@type":"ImageObject","url":"https://ca-times.brightspotcdn.com/dims4/default/8e7e58f/2147483647/strip/true/crop/382x60+0+0/resize/382x60!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fde%2F5f%2F46c2d05b430cbc6e775301df1062%2Flogo-full-black.png","width":382,"height":60}},"name":"News from California, the nation and world  - Los Angeles Times"}</script>

    
    
    <meta name="brightspot.cached" content="false">

    <!--This is needed for custom elements to function in browsers that
    support them natively but that are using es6 code transpiled to es5.
    This will cause a non-fatal error to show up in the IE11 console.
    It can be safely ignored. https://github.com/webcomponents/webcomponentsjs/issues/749 -->
    <script>
        (function () {
        'use strict';

        (()=>{'use strict';if(!window.customElements)return;const a=window.HTMLElement,b=window.customElements.define,c=window.customElements.get,d=new Map,e=new Map;let f=!1,g=!1;window.HTMLElement=function(){if(!f){const a=d.get(this.constructor),b=c.call(window.customElements,a);g=!0;const e=new b;return e}f=!1;},window.HTMLElement.prototype=a.prototype;Object.defineProperty(window,'customElements',{value:window.customElements,configurable:!0,writable:!0}),Object.defineProperty(window.customElements,'define',{value:(c,h)=>{const i=h.prototype,j=class extends a{constructor(){super(),Object.setPrototypeOf(this,i),g||(f=!0,h.call(this)),g=!1;}},k=j.prototype;j.observedAttributes=h.observedAttributes,k.connectedCallback=i.connectedCallback,k.disconnectedCallback=i.disconnectedCallback,k.attributeChangedCallback=i.attributeChangedCallback,k.adoptedCallback=i.adoptedCallback,d.set(h,c),e.set(c,h),b.call(window.customElements,c,j);},configurable:!0,writable:!0}),Object.defineProperty(window.customElements,'get',{value:(a)=>e.get(a),configurable:!0,writable:!0});})();

        /**
        @license
        Copyright (c) 2017 The Polymer Project Authors. All rights reserved.
        This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
        The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
        The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
        Code distributed by Google as part of the polymer project is also
        subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
        */
        }());
    </script>
    <script>
        /**
            For the fastest load times https://developers.google.com/speed/docs/insights/BlockingJS
            and to prevent any FOUC, as well as prevent any race conditions for browsers that also
            rely on the CSS variables polyfill, this is inlined.
        **/
        if (!window.customElements) {
            (function(){
                'use strict';var h=new function(){};var aa=new Set("annotation-xml color-profile font-face font-face-src font-face-uri font-face-format font-face-name missing-glyph".split(" "));function m(b){var a=aa.has(b);b=/^[a-z][.0-9_a-z]*-[\-.0-9_a-z]*$/.test(b);return!a&&b}function n(b){var a=b.isConnected;if(void 0!==a)return a;for(;b&&!(b.__CE_isImportDocument||b instanceof Document);)b=b.parentNode||(window.ShadowRoot&&b instanceof ShadowRoot?b.host:void 0);return!(!b||!(b.__CE_isImportDocument||b instanceof Document))}
                function p(b,a){for(;a&&a!==b&&!a.nextSibling;)a=a.parentNode;return a&&a!==b?a.nextSibling:null}
                function t(b,a,c){c=c?c:new Set;for(var d=b;d;){if(d.nodeType===Node.ELEMENT_NODE){var e=d;a(e);var f=e.localName;if("link"===f&&"import"===e.getAttribute("rel")){d=e.import;if(d instanceof Node&&!c.has(d))for(c.add(d),d=d.firstChild;d;d=d.nextSibling)t(d,a,c);d=p(b,e);continue}else if("template"===f){d=p(b,e);continue}if(e=e.__CE_shadowRoot)for(e=e.firstChild;e;e=e.nextSibling)t(e,a,c)}d=d.firstChild?d.firstChild:p(b,d)}}function u(b,a,c){b[a]=c};function v(){this.a=new Map;this.s=new Map;this.f=[];this.b=!1}function ba(b,a,c){b.a.set(a,c);b.s.set(c.constructor,c)}function w(b,a){b.b=!0;b.f.push(a)}function x(b,a){b.b&&t(a,function(a){return y(b,a)})}function y(b,a){if(b.b&&!a.__CE_patched){a.__CE_patched=!0;for(var c=0;c<b.f.length;c++)b.f[c](a)}}function z(b,a){var c=[];t(a,function(b){return c.push(b)});for(a=0;a<c.length;a++){var d=c[a];1===d.__CE_state?b.connectedCallback(d):A(b,d)}}
                function B(b,a){var c=[];t(a,function(b){return c.push(b)});for(a=0;a<c.length;a++){var d=c[a];1===d.__CE_state&&b.disconnectedCallback(d)}}
                function C(b,a,c){c=c?c:{};var d=c.w||new Set,e=c.i||function(a){return A(b,a)},f=[];t(a,function(a){if("link"===a.localName&&"import"===a.getAttribute("rel")){var c=a.import;c instanceof Node&&(c.__CE_isImportDocument=!0,c.__CE_hasRegistry=!0);c&&"complete"===c.readyState?c.__CE_documentLoadHandled=!0:a.addEventListener("load",function(){var c=a.import;if(!c.__CE_documentLoadHandled){c.__CE_documentLoadHandled=!0;var f=new Set(d);f.delete(c);C(b,c,{w:f,i:e})}})}else f.push(a)},d);if(b.b)for(a=0;a<
                f.length;a++)y(b,f[a]);for(a=0;a<f.length;a++)e(f[a])}
                function A(b,a){if(void 0===a.__CE_state){var c=a.ownerDocument;if(c.defaultView||c.__CE_isImportDocument&&c.__CE_hasRegistry)if(c=b.a.get(a.localName)){c.constructionStack.push(a);var d=c.constructor;try{try{if(new d!==a)throw Error("The custom element constructor did not produce the element being upgraded.");}finally{c.constructionStack.pop()}}catch(r){throw a.__CE_state=2,r;}a.__CE_state=1;a.__CE_definition=c;if(c.attributeChangedCallback)for(c=c.observedAttributes,d=0;d<c.length;d++){var e=c[d],
                        f=a.getAttribute(e);null!==f&&b.attributeChangedCallback(a,e,null,f,null)}n(a)&&b.connectedCallback(a)}}}v.prototype.connectedCallback=function(b){var a=b.__CE_definition;a.connectedCallback&&a.connectedCallback.call(b)};v.prototype.disconnectedCallback=function(b){var a=b.__CE_definition;a.disconnectedCallback&&a.disconnectedCallback.call(b)};
                v.prototype.attributeChangedCallback=function(b,a,c,d,e){var f=b.__CE_definition;f.attributeChangedCallback&&-1<f.observedAttributes.indexOf(a)&&f.attributeChangedCallback.call(b,a,c,d,e)};function D(b,a){this.c=b;this.a=a;this.b=void 0;C(this.c,this.a);"loading"===this.a.readyState&&(this.b=new MutationObserver(this.f.bind(this)),this.b.observe(this.a,{childList:!0,subtree:!0}))}function E(b){b.b&&b.b.disconnect()}D.prototype.f=function(b){var a=this.a.readyState;"interactive"!==a&&"complete"!==a||E(this);for(a=0;a<b.length;a++)for(var c=b[a].addedNodes,d=0;d<c.length;d++)C(this.c,c[d])};function ca(){var b=this;this.b=this.a=void 0;this.f=new Promise(function(a){b.b=a;b.a&&a(b.a)})}function F(b){if(b.a)throw Error("Already resolved.");b.a=void 0;b.b&&b.b(void 0)};function G(b){this.j=!1;this.c=b;this.o=new Map;this.l=function(b){return b()};this.g=!1;this.m=[];this.u=new D(b,document)}
                G.prototype.define=function(b,a){var c=this;if(!(a instanceof Function))throw new TypeError("Custom element constructors must be functions.");if(!m(b))throw new SyntaxError("The element name '"+b+"' is not valid.");if(this.c.a.get(b))throw Error("A custom element with name '"+b+"' has already been defined.");if(this.j)throw Error("A custom element is already being defined.");this.j=!0;var d,e,f,r,k;try{var g=function(b){var a=l[b];if(void 0!==a&&!(a instanceof Function))throw Error("The '"+b+"' callback must be a function.");
                    return a},l=a.prototype;if(!(l instanceof Object))throw new TypeError("The custom element constructor's prototype is not an object.");d=g("connectedCallback");e=g("disconnectedCallback");f=g("adoptedCallback");r=g("attributeChangedCallback");k=a.observedAttributes||[]}catch(q){return}finally{this.j=!1}a={localName:b,constructor:a,connectedCallback:d,disconnectedCallback:e,adoptedCallback:f,attributeChangedCallback:r,observedAttributes:k,constructionStack:[]};ba(this.c,b,a);this.m.push(a);this.g||
                (this.g=!0,this.l(function(){return da(c)}))};G.prototype.i=function(b){C(this.c,b)};function da(b){if(!1!==b.g){b.g=!1;for(var a=b.m,c=[],d=new Map,e=0;e<a.length;e++)d.set(a[e].localName,[]);C(b.c,document,{i:function(a){if(void 0===a.__CE_state){var e=a.localName,f=d.get(e);f?f.push(a):b.c.a.get(e)&&c.push(a)}}});for(e=0;e<c.length;e++)A(b.c,c[e]);for(;0<a.length;){for(var f=a.shift(),e=f.localName,f=d.get(f.localName),r=0;r<f.length;r++)A(b.c,f[r]);(e=b.o.get(e))&&F(e)}}}
                G.prototype.get=function(b){if(b=this.c.a.get(b))return b.constructor};G.prototype.whenDefined=function(b){if(!m(b))return Promise.reject(new SyntaxError("'"+b+"' is not a valid custom element name."));var a=this.o.get(b);if(a)return a.f;a=new ca;this.o.set(b,a);this.c.a.get(b)&&!this.m.some(function(a){return a.localName===b})&&F(a);return a.f};G.prototype.v=function(b){E(this.u);var a=this.l;this.l=function(c){return b(function(){return a(c)})}};window.CustomElementRegistry=G;
                G.prototype.define=G.prototype.define;G.prototype.upgrade=G.prototype.i;G.prototype.get=G.prototype.get;G.prototype.whenDefined=G.prototype.whenDefined;G.prototype.polyfillWrapFlushCallback=G.prototype.v;var H=window.Document.prototype.createElement,ea=window.Document.prototype.createElementNS,fa=window.Document.prototype.importNode,ga=window.Document.prototype.prepend,ha=window.Document.prototype.append,ia=window.DocumentFragment.prototype.prepend,ja=window.DocumentFragment.prototype.append,I=window.Node.prototype.cloneNode,J=window.Node.prototype.appendChild,K=window.Node.prototype.insertBefore,L=window.Node.prototype.removeChild,M=window.Node.prototype.replaceChild,N=Object.getOwnPropertyDescriptor(window.Node.prototype,
                        "textContent"),O=window.Element.prototype.attachShadow,P=Object.getOwnPropertyDescriptor(window.Element.prototype,"innerHTML"),Q=window.Element.prototype.getAttribute,R=window.Element.prototype.setAttribute,S=window.Element.prototype.removeAttribute,T=window.Element.prototype.getAttributeNS,U=window.Element.prototype.setAttributeNS,ka=window.Element.prototype.removeAttributeNS,la=window.Element.prototype.insertAdjacentElement,ma=window.Element.prototype.insertAdjacentHTML,na=window.Element.prototype.prepend,
                        oa=window.Element.prototype.append,V=window.Element.prototype.before,pa=window.Element.prototype.after,qa=window.Element.prototype.replaceWith,ra=window.Element.prototype.remove,sa=window.HTMLElement,W=Object.getOwnPropertyDescriptor(window.HTMLElement.prototype,"innerHTML"),ta=window.HTMLElement.prototype.insertAdjacentElement,ua=window.HTMLElement.prototype.insertAdjacentHTML;function va(){var b=X;window.HTMLElement=function(){function a(){var a=this.constructor,d=b.s.get(a);if(!d)throw Error("The custom element being constructed was not registered with `customElements`.");var e=d.constructionStack;if(!e.length)return e=H.call(document,d.localName),Object.setPrototypeOf(e,a.prototype),e.__CE_state=1,e.__CE_definition=d,y(b,e),e;var d=e.length-1,f=e[d];if(f===h)throw Error("The HTMLElement constructor was either called reentrantly for this constructor or called multiple times.");
                    e[d]=h;Object.setPrototypeOf(f,a.prototype);y(b,f);return f}a.prototype=sa.prototype;return a}()};function Y(b,a,c){function d(a){return function(c){for(var e=[],d=0;d<arguments.length;++d)e[d-0]=arguments[d];for(var d=[],f=[],l=0;l<e.length;l++){var q=e[l];q instanceof Element&&n(q)&&f.push(q);if(q instanceof DocumentFragment)for(q=q.firstChild;q;q=q.nextSibling)d.push(q);else d.push(q)}a.apply(this,e);for(e=0;e<f.length;e++)B(b,f[e]);if(n(this))for(e=0;e<d.length;e++)f=d[e],f instanceof Element&&z(b,f)}}c.h&&(a.prepend=d(c.h));c.append&&(a.append=d(c.append))};function wa(){var b=X;u(Document.prototype,"createElement",function(a){if(this.__CE_hasRegistry){var c=b.a.get(a);if(c)return new c.constructor}a=H.call(this,a);y(b,a);return a});u(Document.prototype,"importNode",function(a,c){a=fa.call(this,a,c);this.__CE_hasRegistry?C(b,a):x(b,a);return a});u(Document.prototype,"createElementNS",function(a,c){if(this.__CE_hasRegistry&&(null===a||"http://www.w3.org/1999/xhtml"===a)){var d=b.a.get(c);if(d)return new d.constructor}a=ea.call(this,a,c);y(b,a);return a});
                    Y(b,Document.prototype,{h:ga,append:ha})};function xa(){var b=X;function a(a,d){Object.defineProperty(a,"textContent",{enumerable:d.enumerable,configurable:!0,get:d.get,set:function(a){if(this.nodeType===Node.TEXT_NODE)d.set.call(this,a);else{var e=void 0;if(this.firstChild){var c=this.childNodes,k=c.length;if(0<k&&n(this))for(var e=Array(k),g=0;g<k;g++)e[g]=c[g]}d.set.call(this,a);if(e)for(a=0;a<e.length;a++)B(b,e[a])}}})}u(Node.prototype,"insertBefore",function(a,d){if(a instanceof DocumentFragment){var e=Array.prototype.slice.apply(a.childNodes);
                    a=K.call(this,a,d);if(n(this))for(d=0;d<e.length;d++)z(b,e[d]);return a}e=n(a);d=K.call(this,a,d);e&&B(b,a);n(this)&&z(b,a);return d});u(Node.prototype,"appendChild",function(a){if(a instanceof DocumentFragment){var c=Array.prototype.slice.apply(a.childNodes);a=J.call(this,a);if(n(this))for(var e=0;e<c.length;e++)z(b,c[e]);return a}c=n(a);e=J.call(this,a);c&&B(b,a);n(this)&&z(b,a);return e});u(Node.prototype,"cloneNode",function(a){a=I.call(this,a);this.ownerDocument.__CE_hasRegistry?C(b,a):x(b,a);
                    return a});u(Node.prototype,"removeChild",function(a){var c=n(a),e=L.call(this,a);c&&B(b,a);return e});u(Node.prototype,"replaceChild",function(a,d){if(a instanceof DocumentFragment){var e=Array.prototype.slice.apply(a.childNodes);a=M.call(this,a,d);if(n(this))for(B(b,d),d=0;d<e.length;d++)z(b,e[d]);return a}var e=n(a),f=M.call(this,a,d),c=n(this);c&&B(b,d);e&&B(b,a);c&&z(b,a);return f});N&&N.get?a(Node.prototype,N):w(b,function(b){a(b,{enumerable:!0,configurable:!0,get:function(){for(var a=[],b=
                            0;b<this.childNodes.length;b++)a.push(this.childNodes[b].textContent);return a.join("")},set:function(a){for(;this.firstChild;)L.call(this,this.firstChild);J.call(this,document.createTextNode(a))}})})};function ya(b){var a=Element.prototype;function c(a){return function(e){for(var c=[],d=0;d<arguments.length;++d)c[d-0]=arguments[d];for(var d=[],k=[],g=0;g<c.length;g++){var l=c[g];l instanceof Element&&n(l)&&k.push(l);if(l instanceof DocumentFragment)for(l=l.firstChild;l;l=l.nextSibling)d.push(l);else d.push(l)}a.apply(this,c);for(c=0;c<k.length;c++)B(b,k[c]);if(n(this))for(c=0;c<d.length;c++)k=d[c],k instanceof Element&&z(b,k)}}V&&(a.before=c(V));V&&(a.after=c(pa));qa&&u(a,"replaceWith",function(a){for(var e=
                        [],c=0;c<arguments.length;++c)e[c-0]=arguments[c];for(var c=[],d=[],k=0;k<e.length;k++){var g=e[k];g instanceof Element&&n(g)&&d.push(g);if(g instanceof DocumentFragment)for(g=g.firstChild;g;g=g.nextSibling)c.push(g);else c.push(g)}k=n(this);qa.apply(this,e);for(e=0;e<d.length;e++)B(b,d[e]);if(k)for(B(b,this),e=0;e<c.length;e++)d=c[e],d instanceof Element&&z(b,d)});ra&&u(a,"remove",function(){var a=n(this);ra.call(this);a&&B(b,this)})};function za(){var b=X;function a(a,c){Object.defineProperty(a,"innerHTML",{enumerable:c.enumerable,configurable:!0,get:c.get,set:function(a){var e=this,d=void 0;n(this)&&(d=[],t(this,function(a){a!==e&&d.push(a)}));c.set.call(this,a);if(d)for(var f=0;f<d.length;f++){var r=d[f];1===r.__CE_state&&b.disconnectedCallback(r)}this.ownerDocument.__CE_hasRegistry?C(b,this):x(b,this);return a}})}function c(a,c){u(a,"insertAdjacentElement",function(a,e){var d=n(e);a=c.call(this,a,e);d&&B(b,e);n(a)&&z(b,e);
                    return a})}function d(a,c){function e(a,e){for(var c=[];a!==e;a=a.nextSibling)c.push(a);for(e=0;e<c.length;e++)C(b,c[e])}u(a,"insertAdjacentHTML",function(a,b){a=a.toLowerCase();if("beforebegin"===a){var d=this.previousSibling;c.call(this,a,b);e(d||this.parentNode.firstChild,this)}else if("afterbegin"===a)d=this.firstChild,c.call(this,a,b),e(this.firstChild,d);else if("beforeend"===a)d=this.lastChild,c.call(this,a,b),e(d||this.firstChild,null);else if("afterend"===a)d=this.nextSibling,c.call(this,
                        a,b),e(this.nextSibling,d);else throw new SyntaxError("The value provided ("+String(a)+") is not one of 'beforebegin', 'afterbegin', 'beforeend', or 'afterend'.");})}O&&u(Element.prototype,"attachShadow",function(a){return this.__CE_shadowRoot=a=O.call(this,a)});P&&P.get?a(Element.prototype,P):W&&W.get?a(HTMLElement.prototype,W):w(b,function(b){a(b,{enumerable:!0,configurable:!0,get:function(){return I.call(this,!0).innerHTML},set:function(a){var b="template"===this.localName,e=b?this.content:this,
                            c=H.call(document,this.localName);for(c.innerHTML=a;0<e.childNodes.length;)L.call(e,e.childNodes[0]);for(a=b?c.content:c;0<a.childNodes.length;)J.call(e,a.childNodes[0])}})});u(Element.prototype,"setAttribute",function(a,c){if(1!==this.__CE_state)return R.call(this,a,c);var e=Q.call(this,a);R.call(this,a,c);c=Q.call(this,a);b.attributeChangedCallback(this,a,e,c,null)});u(Element.prototype,"setAttributeNS",function(a,c,d){if(1!==this.__CE_state)return U.call(this,a,c,d);var e=T.call(this,a,c);U.call(this,
                        a,c,d);d=T.call(this,a,c);b.attributeChangedCallback(this,c,e,d,a)});u(Element.prototype,"removeAttribute",function(a){if(1!==this.__CE_state)return S.call(this,a);var c=Q.call(this,a);S.call(this,a);null!==c&&b.attributeChangedCallback(this,a,c,null,null)});u(Element.prototype,"removeAttributeNS",function(a,c){if(1!==this.__CE_state)return ka.call(this,a,c);var d=T.call(this,a,c);ka.call(this,a,c);var e=T.call(this,a,c);d!==e&&b.attributeChangedCallback(this,c,d,e,a)});ta?c(HTMLElement.prototype,
                        ta):la?c(Element.prototype,la):console.warn("Custom Elements: `Element#insertAdjacentElement` was not patched.");ua?d(HTMLElement.prototype,ua):ma?d(Element.prototype,ma):console.warn("Custom Elements: `Element#insertAdjacentHTML` was not patched.");Y(b,Element.prototype,{h:na,append:oa});ya(b)};/*

                Copyright (c) 2016 The Polymer Project Authors. All rights reserved.
                This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
                The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
                The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
                Code distributed by Google as part of the polymer project is also
                subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
                */
                var Z=window.customElements;if(!Z||Z.forcePolyfill||"function"!=typeof Z.define||"function"!=typeof Z.get){var X=new v;va();wa();Y(X,DocumentFragment.prototype,{h:ia,append:ja});xa();za();document.__CE_hasRegistry=!0;var customElements=new G(X);Object.defineProperty(window,"customElements",{configurable:!0,enumerable:!0,value:customElements})};
            }).call(self);
        }

        /**
            This allows us to load the IE polyfills via feature detection so that they do not load
            needlessly in the browsers that do not need them. It also ensures they are loaded
            non async so that they load before the rest of our JS.
        */
        var head = document.getElementsByTagName('head')[0];
        if (!window.CSS || !window.CSS.supports || !window.CSS.supports('--fake-var', 0)) {
            var script = document.createElement('script');
            script.setAttribute('src', "https://ca-times.brightspotcdn.com/resource/0000016e-6bb5-d505-abef-fbb7e4420000/styleguide/util/IEPolyfills.452f95cdc0d12966e9fce9cdbb03f436.gz.js");
            script.setAttribute('type', 'text/javascript');
            script.async = false;
            head.appendChild(script);
        }
    </script>
    
        <script>
        /** Promo localization rules that come from the CMS */
        var promoLocalization = '{"promo.hourAgo":"{t} hour ago","promo.minuteAgo":"{t} minute ago","promo.hoursAgo":"{t} hours ago","promo.minutesAgo":"{t} minutes ago","maxRelativeTime":10800000,"timeToken":"{t}"}'
        </script>
    
    <script src="https://ca-times.brightspotcdn.com/resource/0000016e-6bb5-d505-abef-fbb7e4420000/styleguide/All.min.a23cb12c7e2e9ee20baff8298af2c63e.gz.js" async></script>

    
<script async="async" type="text/javascript" src="https://ads.rubiconproject.com/prebid/20520_latimes.js"></script>


<script type="application/javascript">// Global varible to avoid multiple refreshes per slot_div
window.confiant_refresh_slots = window.confiant_refresh_slots || [];
/* Wrapper for LA Times, generated on 2019-10-23T08:29:58-04:00 */
(function() {
    var w = window;
    var h = 'clarium.global.ssl.fastly.net';
    w._clrm = w._clrm || {};
    w._clrm.gpt = {
        propertyId: 'GfBGK_P3Adzw1hvTTkQjebew6Z4',
        confiantCdn: h,
        sandbox: 0,
        mapping: 'W3siaSI6MiwidCI6Int7b319Ont7d319eHt7aH19IiwicCI6MCwiRCI6MSwiciI6W119LHsiaSI6NiwidCI6Int7Y299fTp7e3d9fXh7e2h9fSIsInAiOjUwLCJEIjowLCJyIjpbeyJ0IjoiZXgiLCJzIjpudWxsLCJ2IjoiY28ifV19XQ==',
        activation: '|||MjU0OTcwODMyNA==,|||MjU1MTQzMjA0OA==,|||MjU1MTU1NDQ1Nw==,|||MjU1MTc5NjUzNQ==,|||MjU2Nzk0ODA3Nw==,|||MjU3MDg2NjAwMQ==,|||MjU3NDg3NzMyMg==,|||MjU3NDg5MTc4Mg==,|||MjU3NDg5MTc4NQ==,|||MjU3NTQ1MTIzNg==,|||MjU3NTQ1MTkyMA==,|||MjU3NTQ1MzMzMA==,|||MjU3NjAxMDYxNQ==,|||MjU3NjAxMDYxOA==,|||MjU4NTg2ODkzOA==,|||MjU4NjM2Mjc5NA==,|||MjU4ODQzNjE2Nw==,|||MjU1MDkxNDMzNg==,|co|ex|MQ==',
        callback: function(blockingType, blockingId, isBlocked, wrapperId, tagId, impressionData) {
            'use strict';
    // Get Slot Element from impression data passed to callback
    var slot_element = typeof impressionData !== 'undefined' && typeof impressionData.dfp !== 'undefined' ? impressionData.dfp.s : null;
    // Check if ad is blocked and if slot has been refreshed
    if ( isBlocked && confiant_refresh_slots.indexOf(slot_element) === -1 ) {    
        // Get all slots from GPT
        var slots = googletag.pubads().getSlots(),
            slot_length = slots.length,
            i, slot;
        // Loop through slots until slot_element matches
        for ( i=0; i < slot_length; i++ ) {
            slot = slots[i];
             if ( slot_element === slot.getSlotElementId() ) { 
                // Refresh to slot to get a new ad
                googletag.pubads().refresh( [slot] );
                // Mark the element as refreshed so it will not be refreshed again
                confiant_refresh_slots.push( slot_element );
            }
        }
    }
        }
    };
    var e = document.createElement('script');
    e.async = true;
    e.src = '//' + h + '/gpt/a/wrap.js?v2_1';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(e, s);
})();</script>




<script async="async" src="https://www.googletagservices.com/tag/js/gpt.js"></script>


<script>
var dfpKV = dfpKV || {};



 dfpKV.visibilityThresholdEnabled = true;
 dfpKV.refreshInterval = 15; 
 dfpKV.refreshExcludedSizes = [[1280, 220], [1, 1], [970, 90]]; 
dfpKV.pageType = 'sectionfront';
dfpKV.lazyLoadingEnabled = true;
dfpKV.visibilityThreshold = 0.5;
dfpKV.fetchOffset = 1.25;
dfpKV.rdpMode = 'cookie';
dfpKV.amazonTamClientId = '3886';
</script>



<script>
!function(a9,a,p,s,t,A,g){if(a[a9])return;function q(c,r){a[a9]._Q.push([c,r])}a[a9]={init:function(){q("i",arguments)},fetchBids:function(){q("f",arguments)},setDisplayBids:function(){},targetingKeys:function(){return[]},_Q:[]};A=p.createElement(s);A.async=!0;A.src=t;g=p.getElementsByTagName(s)[0];g.parentNode.insertBefore(A,g)}("apstag",window,document,"script","//c.amazon-adsystem.com/aax2/apstag.js");
</script>



<script type="text/javascript">
    // Google tag setup
    var googletag = googletag || {};
    googletag.cmd = googletag.cmd || [];

    // Disable initial load and set initialize
    googletag.cmd.push(function () {
        googletag.pubads().enableSingleRequest()
        googletag.pubads().disableInitialLoad()
        googletag.pubads().enableAsyncRendering()
        googletag.pubads().enableVideoAds()
        googletag.companionAds().setRefreshUnfilledSlots(false)
        googletag.pubads().addEventListener('slotRenderEnded', function (event) {
            ((window.dataLayer || (window.dataLayer = {})).renderedAds || (window.dataLayer.renderedAds =[])).push({
                adsystem: 'bspdfp',
                event: event
            })
        })

        // keywords, slug, content ad identifier, and page type targeting
        if (dfpKV) {
            if (dfpKV.slug) {
                googletag.pubads().setTargeting('slug', dfpKV.slug)
                googletag.pubads().setTargeting('slugwords', dfpKV.slug.split('-'))
            }
            if (dfpKV.keywords) {
                googletag.pubads().setTargeting('topictags', dfpKV.keywords)
            }
            if (dfpKV.pageType) {
                googletag.pubads().setTargeting('pagetype', dfpKV.pageType)
            }
            if (dfpKV.contentIdentifier) {
                googletag.pubads().setTargeting('contentidentifier', dfpKV.contentIdentifier)
            }
        }

        // Design
        googletag.pubads().setTargeting('design', 'bs')

        // Ensighten pixel ID
        let pixelId = window.dataLayer ? window.dataLayer.pixelId : ''
        if (pixelId) {
            googletag.pubads().setTargeting('epvid', pixelId)
        }

        // Subscriber targeting
        ((window.trb || (trb = {})).metering || (trb.metering = [])).push({
            status: function (info) {
                const subLevels = ['1', '2', '3', '4', '555', '888']
                if (info && info.subscriptionLevels && info.subscriptionLevels
                .some(function (level) {
                    return subLevels.includes(level)
                })) {
                    googletag.pubads().setTargeting('sub_status', '1')
                } else {
                    googletag.pubads().setTargeting('sub_status', '0')
                }
            }
        })

        // add screen size targeting
        let screenSize
        if (window.innerWidth > 1024) {
            screenSize = 'medium'
        } else if (window.innerWidth > 1241) {
            screenSize = 'large'
        } else {
            screenSize = 'small'
        }

        // screen size
        googletag.pubads().setTargeting('screensize', screenSize)

        

        googletag.enableServices()

    })

    // setup of ad slots
    var dfpAdSlotsObject = {}
    var staticAdSlots = {}

    
        // setup of pbjs
        var pbjs = pbjs || {}
        pbjs.que = pbjs.que || []
    

    
        //set of Prebid Timeout
        var pbto = 3000
    

    
        // setup of Amazon tag slots
        var apstagSlots = {}
        var apstag = apstag || {}
    
</script>
<script>

  window.fbAsyncInit = function() {
      FB.init({
          
              appId : '119932621434123',
          
          xfbml : true,
          version : 'v2.9'
      });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>
<script type="application/javascript">(function () {
    ((window.trb || (trb = {})).metering || (trb.metering = [])).push('handle-ears');
})();</script>
<script type="application/javascript">//<![CDATA[
_uzactfeed = window._uzactfeed || [];
_uzactfeed.push(['_setID', 'AF013B3D59A7E91180DE0050569444FB']);
_uzactfeed.push(['_setSID', '9E3A142A59A7E91180DE0050569444FB']);
_uzactfeed.push(['_start']);
(function() {
var uz = document.createElement('script'); uz.type = 'text/javascript'; uz.async = true; uz.charset = 'utf-8';
uz.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'cdn5.userzoom.com/feedback/js/uz_feed_us.js?cuid=9F2615D26DCDE41180C90050569444FB';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(uz, s);
})();
//]]></script>

</head>


    

    <body class="Page-body">
        <!-- Putting icons here, so we don't have to include in a bunch of -body hbs's -->
<svg xmlns="http://www.w3.org/2000/svg" style="display:none" id="iconsMap">
    <symbol id="mono-icon-facebook" viewBox="0 0 10 19">
        <path fill-rule="evenodd" d="M2.707 18.25V10.2H0V7h2.707V4.469c0-1.336.375-2.373 1.125-3.112C4.582.62 5.578.25 6.82.25c1.008 0 1.828.047 2.461.14v2.848H7.594c-.633 0-1.067.14-1.301.422-.188.235-.281.61-.281 1.125V7H9l-.422 3.2H6.012v8.05H2.707z"></path>
    </symbol>
    <symbol id="mono-icon-instagram" viewBox="0 0 17 17">
        <g>
            <path fill-rule="evenodd" d="M8.281 4.207c.727 0 1.4.182 2.022.545a4.055 4.055 0 0 1 1.476 1.477c.364.62.545 1.294.545 2.021 0 .727-.181 1.4-.545 2.021a4.055 4.055 0 0 1-1.476 1.477 3.934 3.934 0 0 1-2.022.545c-.726 0-1.4-.182-2.021-.545a4.055 4.055 0 0 1-1.477-1.477 3.934 3.934 0 0 1-.545-2.021c0-.727.182-1.4.545-2.021A4.055 4.055 0 0 1 6.26 4.752a3.934 3.934 0 0 1 2.021-.545zm0 6.68a2.54 2.54 0 0 0 1.864-.774 2.54 2.54 0 0 0 .773-1.863 2.54 2.54 0 0 0-.773-1.863 2.54 2.54 0 0 0-1.864-.774 2.54 2.54 0 0 0-1.863.774 2.54 2.54 0 0 0-.773 1.863c0 .727.257 1.348.773 1.863a2.54 2.54 0 0 0 1.863.774zM13.45 4.03c-.023.258-.123.48-.299.668a.856.856 0 0 1-.65.281.913.913 0 0 1-.668-.28.913.913 0 0 1-.281-.669c0-.258.094-.48.281-.668a.913.913 0 0 1 .668-.28c.258 0 .48.093.668.28.187.188.281.41.281.668zm2.672.95c.023.656.035 1.746.035 3.269 0 1.523-.017 2.62-.053 3.287-.035.668-.134 1.248-.298 1.74a4.098 4.098 0 0 1-.967 1.53 4.098 4.098 0 0 1-1.53.966c-.492.164-1.072.264-1.74.3-.668.034-1.763.052-3.287.052-1.523 0-2.619-.018-3.287-.053-.668-.035-1.248-.146-1.74-.334a3.747 3.747 0 0 1-1.53-.931 4.098 4.098 0 0 1-.966-1.53c-.164-.492-.264-1.072-.299-1.74C.424 10.87.406 9.773.406 8.25S.424 5.63.46 4.963c.035-.668.135-1.248.299-1.74.21-.586.533-1.096.967-1.53A4.098 4.098 0 0 1 3.254.727c.492-.164 1.072-.264 1.74-.3C5.662.394 6.758.376 8.281.376c1.524 0 2.62.018 3.287.053.668.035 1.248.135 1.74.299a4.098 4.098 0 0 1 2.496 2.496c.165.492.27 1.078.317 1.757zm-1.687 7.91c.14-.399.234-1.032.28-1.899.024-.515.036-1.242.036-2.18V7.689c0-.961-.012-1.688-.035-2.18-.047-.89-.14-1.524-.281-1.899a2.537 2.537 0 0 0-1.512-1.511c-.375-.14-1.008-.235-1.899-.282a51.292 51.292 0 0 0-2.18-.035H7.72c-.938 0-1.664.012-2.18.035-.867.047-1.5.141-1.898.282a2.537 2.537 0 0 0-1.512 1.511c-.14.375-.234 1.008-.281 1.899a51.292 51.292 0 0 0-.036 2.18v1.125c0 .937.012 1.664.036 2.18.047.866.14 1.5.28 1.898.306.726.81 1.23 1.513 1.511.398.141 1.03.235 1.898.282.516.023 1.242.035 2.18.035h1.125c.96 0 1.687-.012 2.18-.035.89-.047 1.523-.141 1.898-.282.726-.304 1.23-.808 1.512-1.511z"></path>
        </g>
    </symbol>
    <symbol id="mono-icon-email" viewBox="0 0 512 512">
        <g>
            <path d="M67,148.7c11,5.8,163.8,89.1,169.5,92.1c5.7,3,11.5,4.4,20.5,4.4c9,0,14.8-1.4,20.5-4.4c5.7-3,158.5-86.3,169.5-92.1
                c4.1-2.1,11-5.9,12.5-10.2c2.6-7.6-0.2-10.5-11.3-10.5H257H65.8c-11.1,0-13.9,3-11.3,10.5C56,142.9,62.9,146.6,67,148.7z"></path>
            <path d="M455.7,153.2c-8.2,4.2-81.8,56.6-130.5,88.1l82.2,92.5c2,2,2.9,4.4,1.8,5.6c-1.2,1.1-3.8,0.5-5.9-1.4l-98.6-83.2
                c-14.9,9.6-25.4,16.2-27.2,17.2c-7.7,3.9-13.1,4.4-20.5,4.4c-7.4,0-12.8-0.5-20.5-4.4c-1.9-1-12.3-7.6-27.2-17.2l-98.6,83.2
                c-2,2-4.7,2.6-5.9,1.4c-1.2-1.1-0.3-3.6,1.7-5.6l82.1-92.5c-48.7-31.5-123.1-83.9-131.3-88.1c-8.8-4.5-9.3,0.8-9.3,4.9
                c0,4.1,0,205,0,205c0,9.3,13.7,20.9,23.5,20.9H257h185.5c9.8,0,21.5-11.7,21.5-20.9c0,0,0-201,0-205
                C464,153.9,464.6,148.7,455.7,153.2z"></path>
        </g>
    </symbol>
    <symbol id="mono-icon-print" viewBox="0 0 12 12">
        <g fill-rule="evenodd">
            <path fill-rule="nonzero" d="M9 10V7H3v3H1a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v3.132A2.868 2.868 0 0 1 9.132 10H9zm.5-4.5a1 1 0 1 0 0-2 1 1 0 0 0 0 2zM3 0h6v2H3z"></path>
            <path d="M4 8h4v4H4z"></path>
        </g>
    </symbol>
    <symbol id="mono-icon-copylink" viewBox="0 0 12 12">
        <g fill-rule="evenodd">
            <path d="M10.199 2.378c.222.205.4.548.465.897.062.332.016.614-.132.774L8.627 6.106c-.187.203-.512.232-.75-.014a.498.498 0 0 0-.706.028.499.499 0 0 0 .026.706 1.509 1.509 0 0 0 2.165-.04l1.903-2.06c.37-.398.506-.98.382-1.636-.105-.557-.392-1.097-.77-1.445L9.968.8C9.591.452 9.03.208 8.467.145 7.803.072 7.233.252 6.864.653L4.958 2.709a1.509 1.509 0 0 0 .126 2.161.5.5 0 1 0 .68-.734c-.264-.218-.26-.545-.071-.747L7.597 1.33c.147-.16.425-.228.76-.19.353.038.71.188.931.394l.91.843.001.001zM1.8 9.623c-.222-.205-.4-.549-.465-.897-.062-.332-.016-.614.132-.774l1.905-2.057c.187-.203.512-.232.75.014a.498.498 0 0 0 .706-.028.499.499 0 0 0-.026-.706 1.508 1.508 0 0 0-2.165.04L.734 7.275c-.37.399-.506.98-.382 1.637.105.557.392 1.097.77 1.445l.91.843c.376.35.937.594 1.5.656.664.073 1.234-.106 1.603-.507L7.04 9.291a1.508 1.508 0 0 0-.126-2.16.5.5 0 0 0-.68.734c.264.218.26.545.071.747l-1.904 2.057c-.147.16-.425.228-.76.191-.353-.038-.71-.188-.931-.394l-.91-.843z"></path>
            <path d="M8.208 3.614a.5.5 0 0 0-.707.028L3.764 7.677a.5.5 0 0 0 .734.68L8.235 4.32a.5.5 0 0 0-.027-.707"></path>
        </g>
    </symbol>
    <symbol id="mono-icon-linkedin" viewBox="0 0 16 17">
        <g fill-rule="evenodd">
            <path d="M3.734 16.125H.464V5.613h3.27zM2.117 4.172c-.515 0-.96-.188-1.336-.563A1.825 1.825 0 0 1 .22 2.273c0-.515.187-.96.562-1.335.375-.375.82-.563 1.336-.563.516 0 .961.188 1.336.563.375.375.563.82.563 1.335 0 .516-.188.961-.563 1.336-.375.375-.82.563-1.336.563zM15.969 16.125h-3.27v-5.133c0-.844-.07-1.453-.21-1.828-.259-.633-.762-.95-1.512-.95s-1.278.282-1.582.845c-.235.421-.352 1.043-.352 1.863v5.203H5.809V5.613h3.128v1.442h.036c.234-.469.609-.856 1.125-1.16.562-.375 1.218-.563 1.968-.563 1.524 0 2.59.48 3.2 1.441.468.774.703 1.97.703 3.586v5.766z"></path>
        </g>
    </symbol>
    <symbol id="mono-icon-pinterest" viewBox="0 0 512 512">
        <g>
            <path d="M256,32C132.3,32,32,132.3,32,256c0,91.7,55.2,170.5,134.1,205.2c-0.6-15.6-0.1-34.4,3.9-51.4
                c4.3-18.2,28.8-122.1,28.8-122.1s-7.2-14.3-7.2-35.4c0-33.2,19.2-58,43.2-58c20.4,0,30.2,15.3,30.2,33.6
                c0,20.5-13.1,51.1-19.8,79.5c-5.6,23.8,11.9,43.1,35.4,43.1c42.4,0,71-54.5,71-119.1c0-49.1-33.1-85.8-93.2-85.8
                c-67.9,0-110.3,50.7-110.3,107.3c0,19.5,5.8,33.3,14.8,43.9c4.1,4.9,4.7,6.9,3.2,12.5c-1.1,4.1-3.5,14-4.6,18
                c-1.5,5.7-6.1,7.7-11.2,5.6c-31.3-12.8-45.9-47-45.9-85.6c0-63.6,53.7-139.9,160.1-139.9c85.5,0,141.8,61.9,141.8,128.3
                c0,87.9-48.9,153.5-120.9,153.5c-24.2,0-46.9-13.1-54.7-27.9c0,0-13,51.6-15.8,61.6c-4.7,17.3-14,34.5-22.5,48
                c20.1,5.9,41.4,9.2,63.5,9.2c123.7,0,224-100.3,224-224C480,132.3,379.7,32,256,32z"></path>
        </g>
    </symbol>
    <symbol id="mono-icon-tumblr" viewBox="0 0 512 512">
        <g>
            <path d="M321.2,396.3c-11.8,0-22.4-2.8-31.5-8.3c-6.9-4.1-11.5-9.6-14-16.4c-2.6-6.9-3.6-22.3-3.6-46.4V224h96v-64h-96V48h-61.9
                c-2.7,21.5-7.5,44.7-14.5,58.6c-7,13.9-14,25.8-25.6,35.7c-11.6,9.9-25.6,17.9-41.9,23.3V224h48v140.4c0,19,2,33.5,5.9,43.5
                c4,10,11.1,19.5,21.4,28.4c10.3,8.9,22.8,15.7,37.3,20.5c14.6,4.8,31.4,7.2,50.4,7.2c16.7,0,30.3-1.7,44.7-5.1
                c14.4-3.4,30.5-9.3,48.2-17.6v-65.6C363.2,389.4,342.3,396.3,321.2,396.3z"></path>
        </g>
    </symbol>
    <symbol id="mono-icon-twitter" viewBox="0 0 19 16">
        <g>
            <path fill-rule="evenodd" d="M16.48 4.594c.024.094.036.246.036.457 0 1.687-.41 3.316-1.23 4.887-.845 1.664-2.028 2.988-3.552 3.972-1.664 1.102-3.574 1.652-5.73 1.652-2.063 0-3.95-.55-5.66-1.652.258.024.55.035.879.035 1.71 0 3.246-.527 4.605-1.582-.82 0-1.54-.24-2.162-.72a3.671 3.671 0 0 1-1.283-1.811c.234.023.457.035.668.035.328 0 .656-.035.984-.105a3.72 3.72 0 0 1-2.11-1.301 3.54 3.54 0 0 1-.843-2.32v-.07a3.475 3.475 0 0 0 1.652.492A4.095 4.095 0 0 1 1.54 5.227a3.546 3.546 0 0 1-.457-1.776c0-.644.176-1.26.527-1.845a10.18 10.18 0 0 0 3.358 2.742 10.219 10.219 0 0 0 4.236 1.125 5.124 5.124 0 0 1-.07-.844c0-.656.164-1.272.492-1.846a3.613 3.613 0 0 1 1.336-1.353 3.565 3.565 0 0 1 1.828-.492c.54 0 1.037.105 1.494.316.457.21.861.492 1.213.844a7.51 7.51 0 0 0 2.356-.88c-.282.868-.82 1.548-1.618 2.04a7.93 7.93 0 0 0 2.11-.598 8.114 8.114 0 0 1-1.864 1.934z"></path>

        </g>
    </symbol>
    <symbol id="mono-icon-github" viewBox="0 0 19 16">
        <g>
            <path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"></path>
        </g>
    </symbol>
    <symbol id="mono-icon-youtube" viewBox="0 0 512 512">
        <g>
            <path fill-rule="evenodd" d="M508.6,148.8c0-45-33.1-81.2-74-81.2C379.2,65,322.7,64,265,64c-3,0-6,0-9,0s-6,0-9,0c-57.6,0-114.2,1-169.6,3.6
                c-40.8,0-73.9,36.4-73.9,81.4C1,184.6-0.1,220.2,0,255.8C-0.1,291.4,1,327,3.4,362.7c0,45,33.1,81.5,73.9,81.5
                c58.2,2.7,117.9,3.9,178.6,3.8c60.8,0.2,120.3-1,178.6-3.8c40.9,0,74-36.5,74-81.5c2.4-35.7,3.5-71.3,3.4-107
                C512.1,220.1,511,184.5,508.6,148.8z M207,353.9V157.4l145,98.2L207,353.9z"></path>
        </g>
    </symbol>
    <symbol id="icon-magnify" viewBox="0 0 512 512">
        <g>
            <path d="M337.509,305.372h-17.501l-6.571-5.486c20.791-25.232,33.922-57.054,33.922-93.257
                C347.358,127.632,283.896,64,205.135,64C127.452,64,64,127.632,64,206.629s63.452,142.628,142.225,142.628
                c35.011,0,67.831-13.167,92.991-34.008l6.561,5.487v17.551L415.18,448L448,415.086L337.509,305.372z M206.225,305.372
                c-54.702,0-98.463-43.887-98.463-98.743c0-54.858,43.761-98.742,98.463-98.742c54.7,0,98.462,43.884,98.462,98.742
                C304.687,261.485,260.925,305.372,206.225,305.372z"></path>
        </g>
    </symbol>
    <symbol id="burger-menu" viewBox="0 0 14 10">
        <g>
            <path fill-rule="evenodd" d="M0 5.5v-1h14v1H0zM0 1V0h14v1H0zm0 9V9h14v1H0z"></path>
        </g>
    </symbol>
    <symbol id="close-x" viewBox="0 0 14 14">
        <g>
            <path fill-rule="nonzero" d="M6.336 7L0 .664.664 0 7 6.336 13.336 0 14 .664 7.664 7 14 13.336l-.664.664L7 7.664.664 14 0 13.336 6.336 7z"></path>
        </g>
    </symbol>
    <symbol id="share-more-arrow" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;">
        <g>
            <g>
                <path d="M512,241.7L273.643,3.343v156.152c-71.41,3.744-138.015,33.337-188.958,84.28C30.075,298.384,0,370.991,0,448.222v60.436
                    l29.069-52.985c45.354-82.671,132.173-134.027,226.573-134.027c5.986,0,12.004,0.212,18.001,0.632v157.779L512,241.7z
                    M255.642,290.666c-84.543,0-163.661,36.792-217.939,98.885c26.634-114.177,129.256-199.483,251.429-199.483h15.489V78.131
                    l163.568,163.568L304.621,405.267V294.531l-13.585-1.683C279.347,291.401,267.439,290.666,255.642,290.666z"></path>
            </g>
        </g>
    </symbol>
    <symbol id="chevron" viewBox="0 0 100 100">
        <g>
            <path d="M22.4566257,37.2056786 L-21.4456527,71.9511488 C-22.9248661,72.9681457 -24.9073712,72.5311671 -25.8758148,70.9765924 L-26.9788683,69.2027424 C-27.9450684,67.6481676 -27.5292733,65.5646602 -26.0500598,64.5484493 L20.154796,28.2208967 C21.5532435,27.2597011 23.3600078,27.2597011 24.759951,28.2208967 L71.0500598,64.4659264 C72.5292733,65.4829232 72.9450684,67.5672166 71.9788683,69.1217913 L70.8750669,70.8956413 C69.9073712,72.4502161 67.9241183,72.8848368 66.4449048,71.8694118 L22.4566257,37.2056786 Z" id="Transparent-Chevron" transform="translate(22.500000, 50.000000) rotate(90.000000) translate(-22.500000, -50.000000) "></path>
        </g>
    </symbol>
    <symbol id="play-arrow" viewBox="0 0 30 30">
        <g fill="none" fill-rule="evenodd">
            <path d="M9 9l12 6-12 6z"></path>
        </g>
    </symbol>
    <symbol id="bookmark" viewBox="0 0 9 12">
        <g>
            <path fill="none" fill-rule="evenodd" d="M.5.5v10.997l3.431-2.374a1 1 0 0 1 1.138 0L8.5 11.497V.5h-8z"></path>
        </g>
    </symbol>
    <symbol id="heart" viewBox="0 0 14 12">
        <g>
            <path fill="none" fill-rule="evenodd" d="M10.24.5c-1.098 0-2.152.576-2.808 1.7L7 2.938l-.432-.74C5.912 1.076 4.858.5 3.76.5 1.996.5.5 1.899.5 3.859.5 5.2 1.644 6.912 3.57 8.747a27.774 27.774 0 0 0 3.373 2.738A.099.099 0 0 0 7 11.5a.104.104 0 0 0 .061-.018 27.75 27.75 0 0 0 3.368-2.735C12.356 6.912 13.5 5.201 13.5 3.859 13.5 1.899 12.003.5 10.24.5z"></path>
        </g>
    </symbol>
    <symbol id="grid" viewBox="0 0 32 32">
        <g>
            <path d="M6.4,5.7 C6.4,6.166669 6.166669,6.4 5.7,6.4 L0.7,6.4 C0.233331,6.4 0,6.166669 0,5.7 L0,0.7 C0,0.233331 0.233331,0 0.7,0 L5.7,0 C6.166669,0 6.4,0.233331 6.4,0.7 L6.4,5.7 Z M19.2,5.7 C19.2,6.166669 18.966669,6.4 18.5,6.4 L13.5,6.4 C13.033331,6.4 12.8,6.166669 12.8,5.7 L12.8,0.7 C12.8,0.233331 13.033331,0 13.5,0 L18.5,0 C18.966669,0 19.2,0.233331 19.2,0.7 L19.2,5.7 Z M32,5.7 C32,6.166669 31.766669,6.4 31.3,6.4 L26.3,6.4 C25.833331,6.4 25.6,6.166669 25.6,5.7 L25.6,0.7 C25.6,0.233331 25.833331,0 26.3,0 L31.3,0 C31.766669,0 32,0.233331 32,0.7 L32,5.7 Z M6.4,18.5 C6.4,18.966669 6.166669,19.2 5.7,19.2 L0.7,19.2 C0.233331,19.2 0,18.966669 0,18.5 L0,13.5 C0,13.033331 0.233331,12.8 0.7,12.8 L5.7,12.8 C6.166669,12.8 6.4,13.033331 6.4,13.5 L6.4,18.5 Z M19.2,18.5 C19.2,18.966669 18.966669,19.2 18.5,19.2 L13.5,19.2 C13.033331,19.2 12.8,18.966669 12.8,18.5 L12.8,13.5 C12.8,13.033331 13.033331,12.8 13.5,12.8 L18.5,12.8 C18.966669,12.8 19.2,13.033331 19.2,13.5 L19.2,18.5 Z M32,18.5 C32,18.966669 31.766669,19.2 31.3,19.2 L26.3,19.2 C25.833331,19.2 25.6,18.966669 25.6,18.5 L25.6,13.5 C25.6,13.033331 25.833331,12.8 26.3,12.8 L31.3,12.8 C31.766669,12.8 32,13.033331 32,13.5 L32,18.5 Z M6.4,31.3 C6.4,31.766669 6.166669,32 5.7,32 L0.7,32 C0.233331,32 0,31.766669 0,31.3 L0,26.3 C0,25.833331 0.233331,25.6 0.7,25.6 L5.7,25.6 C6.166669,25.6 6.4,25.833331 6.4,26.3 L6.4,31.3 Z M19.2,31.3 C19.2,31.766669 18.966669,32 18.5,32 L13.5,32 C13.033331,32 12.8,31.766669 12.8,31.3 L12.8,26.3 C12.8,25.833331 13.033331,25.6 13.5,25.6 L18.5,25.6 C18.966669,25.6 19.2,25.833331 19.2,26.3 L19.2,31.3 Z M32,31.3 C32,31.766669 31.766669,32 31.3,32 L26.3,32 C25.833331,32 25.6,31.766669 25.6,31.3 L25.6,26.3 C25.6,25.833331 25.833331,25.6 26.3,25.6 L31.3,25.6 C31.766669,25.6 32,25.833331 32,26.3 L32,31.3 Z"></path>
        </g>
    </symbol>
    <symbol id="filter" viewBox="0 0 16 12">
        <path d="M0 2V0h16v2H0zm2.4 5V5h11.2v2H2.4zm2.4 5v-2h6.4v2H4.8z"></path>
    </symbol>
    <symbol id="icon-clock" viewBox="0 0 12 12">
        <g>
            <path d="M9.692 6a.457.457 0 0 0-.454-.46H6.461V2.77a.462.462 0 1 0-.923 0V6A.462.462 0 0 0 6 6.463h3.238A.457.457 0 0 0 9.692 6m1.386 0A5.078 5.078 0 1 1 6 .921 5.078 5.078 0 0 1 11.078 6M12 6a6 6 0 1 0-6 6 6 6 0 0 0 6-6"></path>
        </g>
    </symbol>
    <symbol id="icon-people" viewBox="0 0 19.8 15">
         <defs>
            <style>
                .people-1{fill:#e0e0e0}.people-2{fill:#ccc}.people-3{fill:#434343}
            </style>
        </defs>
        <g id="three">
            <path id="Path_7077" d="M12.179 62.44h-2.163a4.839 4.839 0 0 1-6.233 0H1.621A1.627 1.627 0 0 0 0 64.065v3.422h13.8v-3.422a1.629 1.629 0 0 0-1.621-1.625z" class="people-1" data-name="Path 7077" transform="translate(0 -52.487)"/>
            <path id="Path_7078" d="M20.61 0c-2.37 0-4.29 2.042-4.29 4.868s1.92 5.118 4.29 5.118 4.29-2.292 4.29-5.118S22.98 0 20.61 0z" class="people-1" data-name="Path 7078" transform="translate(-13.71)"/>
        </g>
        <g id="two" transform="translate(3)">
            <path id="Path_7077-2" d="M12.179 62.44h-2.163a4.839 4.839 0 0 1-6.233 0H1.621A1.627 1.627 0 0 0 0 64.065v3.422h13.8v-3.422a1.629 1.629 0 0 0-1.621-1.625z" class="people-2" data-name="Path 7077" transform="translate(0 -52.487)"/>
            <path id="Path_7078-2" d="M20.61 0c-2.37 0-4.29 2.042-4.29 4.868s1.92 5.118 4.29 5.118 4.29-2.292 4.29-5.118S22.98 0 20.61 0z" class="people-2" data-name="Path 7078" transform="translate(-13.71)"/>
        </g>
        <g id="one" transform="translate(6)">
            <path id="Path_7077-3" d="M12.179 62.44h-2.163a4.839 4.839 0 0 1-6.233 0H1.621A1.627 1.627 0 0 0 0 64.065v3.422h13.8v-3.422a1.629 1.629 0 0 0-1.621-1.625z" class="people-3" data-name="Path 7077" transform="translate(0 -52.487)"/>
            <path id="Path_7078-3" d="M20.61 0c-2.37 0-4.29 2.042-4.29 4.868s1.92 5.118 4.29 5.118 4.29-2.292 4.29-5.118S22.98 0 20.61 0z" class="people-3" data-name="Path 7078" transform="translate(-13.71)"/>
        </g>
    </symbol>
    <symbol id="icon-flying-envelope" viewBox="0 0 50 20">
      <g id="lines" transform="translate(0 4)">
        <path id="Path_6272" data-name="Path 6272" d="M41.614,47.737c0-.435-.382-.746-.916-.746H24.529c-.534,0-.915.311-.915.746a.846.846,0,0,0,.991.747H40.7C41.232,48.484,41.614,48.173,41.614,47.737Z" transform="translate(-23.614 -46.991)" fill="#333"/>
        <path id="Path_6273" data-name="Path 6273" d="M41.134,61.628H33.892c-.545,0-.934.312-.934.747s.389.746.934.746h7.242c.545,0,.935-.311.935-.746A.829.829,0,0,0,41.134,61.628Z" transform="translate(-24.569 -53.499)" fill="#333"/>
        <path id="Path_6274" data-name="Path 6274" d="M41.134,54.311H30.155c-.545,0-.935.312-.935.75s.39.75.935.75H41.134c.545,0,.935-.312.935-.75A.873.873,0,0,0,41.134,54.311Z" transform="translate(-24.569 -50.245)" fill="#333"/>
      </g>
      <path id="envelope" d="M56.064,52.362V33.59a.626.626,0,0,0-.638-.614H28.7a.626.626,0,0,0-.638.614V52.362a.626.626,0,0,0,.638.614H55.426A.626.626,0,0,0,56.064,52.362ZM29.34,34.9l8.69,7.916-8.69,8.206ZM43.6,43.421a2.117,2.117,0,0,1-3.067-.018l-10.1-9.2H53.777Zm-4.637.241.68.62A3.51,3.51,0,0,0,42.069,45.3h.03a3.5,3.5,0,0,0,2.385-1l.739-.669,8.6,8.117H30.395Zm7.2-.872,8.634-7.816v15.97Z" transform="translate(-6.064 -32.976)" fill="#333"/>
    </symbol>
</svg>


<ps-header class="Page-header-wrapper" data-logo-swap>
    <div class="Page-header-hamburger-menu">
        <div class="Page-header-hamburger-menu-wrapper">
            <div class="Page-header-hamburger-menu-content">
                <div class="dss-nav-trial" data-reg-role="trial"></div>
                
                    <nav class="Navigation" >
    
    
        <ul class="Navigation-items">
            
                <li class="Navigation-items-item" data-click="nav0" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href="https://www.latimes.com/business">Business</a>
        
        
    </div>

    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav1" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href="https://www.latimes.com/california">California</a>
        
        
    </div>

    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav2" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href="https://www.latimes.com/environment">Climate &amp; Environment</a>
        
        
    </div>

    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav3" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href="https://www.latimes.com/entertainment-arts">Entertainment &amp; Arts</a>
        
        
    </div>

    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav4" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href="https://www.latimes.com/food">Food</a>
        
        
    </div>

    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav5" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href="https://www.latimes.com/business/real-estate">Hot Property</a>
        
        
    </div>

    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav6" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href="https://www.latimes.com/homeless-housing">Housing &amp; Homelessness</a>
        
        
    </div>

    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav7" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href="https://www.latimes.com/lifestyle">Lifestyle</a>
        
        
    </div>

    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav8" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href="https://www.latimes.com/obituaries">Obituaries</a>
        
        
    </div>

    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav9" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href="https://www.latimes.com/opinion">Opinion</a>
        
        
    </div>

    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav10" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href="https://www.latimes.com/politics">Politics</a>
        
        
    </div>

    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav11" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href="https://www.latimes.com/science">Science</a>
        
        
    </div>

    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav12" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href="https://www.latimes.com/sports">Sports</a>
        
        
    </div>

    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav13" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href="https://www.latimes.com/travel">Travel</a>
        
        
    </div>

    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav14" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href="https://www.latimes.com/world-nation">World &amp; Nation</a>
        
        
    </div>

    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav15" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <span>_________________</span>
        
        
    </div>

    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav16" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href="https://www.latimes.com/about">About Us </a>
        
        
            <div class="NavigationItem-more">
                <button aria-label="Open Sub Navigation"><svg class="chevron"><use xlink:href="#chevron"></use></svg></button>
            </div>
        
    </div>

    
        <ul class="NavigationItem-items">
            
                
                    <li class="NavigationItem-items-item"  data-click="navsub0">
    <a class="NavigationLink" href="https://latimes.newspapers.com/" target="_blank">Archives</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub1">
    <a class="NavigationLink" href="https://www.latimes.com/about/for-the-record/">For the Record</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub2">
    <a class="NavigationLink" href="https://www.latimes.com/tips/" target="_blank">Got a Tip? </a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub3">
    <a class="NavigationLink" href="https://nantmedia.wd5.myworkdayjobs.com/LATimesCareers" target="_blank">L.A. Times Careers</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub4">
    <a class="NavigationLink" href="https://www.latimes.com/about/events/">L.A. Times Events</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub5">
    <a class="NavigationLink" href=" https://store.latimes.com/?utm_source=latimes&amp;utm_medium=homepage&amp;utm_campaign=homepage_subnav" target="_blank">L.A. Times Store</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub6">
    <a class="NavigationLink" href="https://www.latimes.com/newsroom-directory">Newsroom Directory</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub7">
    <a class="NavigationLink" href="https://www.latimes.com/about/la-reprint-request-splash-htmlstory.html" target="_blank">Reprints, Rights &amp; Permissions</a>
</li>
                
            
        </ul>
        <ul class="NavigationItem-items-placeholder">
            
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://latimes.newspapers.com/" target="_blank">Archives</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://www.latimes.com/about/for-the-record/">For the Record</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://www.latimes.com/tips/" target="_blank">Got a Tip? </a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://nantmedia.wd5.myworkdayjobs.com/LATimesCareers" target="_blank">L.A. Times Careers</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://www.latimes.com/about/events/">L.A. Times Events</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href=" https://store.latimes.com/?utm_source=latimes&amp;utm_medium=homepage&amp;utm_campaign=homepage_subnav" target="_blank">L.A. Times Store</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://www.latimes.com/newsroom-directory">Newsroom Directory</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://www.latimes.com/about/la-reprint-request-splash-htmlstory.html" target="_blank">Reprints, Rights &amp; Permissions</a>
</li>
                
            
        </ul>
    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav17" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href="https://placeanad.latimes.com/" target="_blank" rel="noopener">Advertising</a>
        
        
            <div class="NavigationItem-more">
                <button aria-label="Open Sub Navigation"><svg class="chevron"><use xlink:href="#chevron"></use></svg></button>
            </div>
        
    </div>

    
        <ul class="NavigationItem-items">
            
                
                    <li class="NavigationItem-items-item"  data-click="navsub0">
    <a class="NavigationLink" href="https://placeanad.latimes.com/" target="_blank" rel="noopener">Place an Ad</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub1">
    <a class="NavigationLink" href="https://classifieds.latimes.com/" target="_blank" rel="noopener">Classifieds</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub2">
    <a class="NavigationLink" href="https://jobs.latimes.com/" target="_blank" rel="noopener">Find/Post Jobs</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub3">
    <a class="NavigationLink" href="https://marketplace.latimes.com/" target="_blank" rel="noopener">Local Ads Marketplace</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub4">
    <a class="NavigationLink" href="https://marketplace.latimes.com/places/types:23" target="_blank">Hot Property Sections</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub5">
    <a class="NavigationLink" href="https://placeanad.latimes.com/open-house" target="_blank">Place an Open House</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub6">
    <a class="NavigationLink" href="https://marketplace.latimes.com/places/categories:43" target="_blank">Sotheby’s International Realty</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub7">
    <a class="NavigationLink" href="https://mediakit.latimes.com/" target="_blank" rel="noopener">Why L.A. Times?</a>
</li>
                
            
        </ul>
        <ul class="NavigationItem-items-placeholder">
            
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://placeanad.latimes.com/" target="_blank" rel="noopener">Place an Ad</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://classifieds.latimes.com/" target="_blank" rel="noopener">Classifieds</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://jobs.latimes.com/" target="_blank" rel="noopener">Find/Post Jobs</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://marketplace.latimes.com/" target="_blank" rel="noopener">Local Ads Marketplace</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://marketplace.latimes.com/places/types:23" target="_blank">Hot Property Sections</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://placeanad.latimes.com/open-house" target="_blank">Place an Open House</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://marketplace.latimes.com/places/categories:43" target="_blank">Sotheby’s International Realty</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://mediakit.latimes.com/" target="_blank" rel="noopener">Why L.A. Times?</a>
</li>
                
            
        </ul>
    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav18" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href="https://www.latimes.com/brandpublishing">Brand Publishing</a>
        
        
    </div>

    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav19" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href="https://www.latimes.com/games">Crossword &amp; Games</a>
        
        
    </div>

    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav20" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href="https://www.latimes.com/local/california/la-voice-audio-la-times-alexa-20181207-story.html" target="_blank">L.A. Times News Platforms</a>
        
        
            <div class="NavigationItem-more">
                <button aria-label="Open Sub Navigation"><svg class="chevron"><use xlink:href="#chevron"></use></svg></button>
            </div>
        
    </div>

    
        <ul class="NavigationItem-items">
            
                
                    <li class="NavigationItem-items-item"  data-click="navsub0">
    <a class="NavigationLink" href="https://www.latimes.com/local/california/la-voice-audio-la-times-alexa-20181207-story.html">Audio Briefs for Smart Speakers</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub1">
    <a class="NavigationLink" href="https://www.latimes.com/espanol/">L.A. Times En Español</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub2">
    <a class="NavigationLink" href="https://enewspaper.latimes.com/ " target="_blank">eNewspaper</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub3">
    <a class="NavigationLink" href="https://apps.apple.com/us/app/la-times/id373238146" target="_blank">News App: Apple IOS</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub4">
    <a class="NavigationLink" href="https://play.google.com/store/apps/details?id=com.apptivateme.next.la&amp;hl=en_US" target="_blank">News App: Google Play</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub5">
    <a class="NavigationLink" href="https://membership.latimes.com/newsletters/" target="_blank">Newsletters</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub6">
    <a class="NavigationLink" href="https://www.latimes.com/california/story/2019-07-16/los-angeles-times-podcasts" target="_blank">Podcasts</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub7">
    <a class="NavigationLink" href="https://www.youtube.com/user/losangelestimes" target="_blank">YouTube</a>
</li>
                
            
        </ul>
        <ul class="NavigationItem-items-placeholder">
            
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://www.latimes.com/local/california/la-voice-audio-la-times-alexa-20181207-story.html">Audio Briefs for Smart Speakers</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://www.latimes.com/espanol/">L.A. Times En Español</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://enewspaper.latimes.com/ " target="_blank">eNewspaper</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://apps.apple.com/us/app/la-times/id373238146" target="_blank">News App: Apple IOS</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://play.google.com/store/apps/details?id=com.apptivateme.next.la&amp;hl=en_US" target="_blank">News App: Google Play</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://membership.latimes.com/newsletters/" target="_blank">Newsletters</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://www.latimes.com/california/story/2019-07-16/los-angeles-times-podcasts" target="_blank">Podcasts</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://www.youtube.com/user/losangelestimes" target="_blank">YouTube</a>
</li>
                
            
        </ul>
    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav21" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href=" https://store.latimes.com/?utm_source=latimes&amp;utm_medium=homepage&amp;utm_campaign=homepage_nav" target="_blank">L.A. Times Store</a>
        
        
    </div>

    
</div></li>
            
                <li class="Navigation-items-item" data-click="nav22" ><div class="NavigationItem">
    <div class="NavigationItem-text">
        
            <a class="NavigationItem-text-link" href="https://www.latimes.com/flyoutsubscribe" target="_blank" rel="noopener">Subscriptions</a>
        
        
            <div class="NavigationItem-more">
                <button aria-label="Open Sub Navigation"><svg class="chevron"><use xlink:href="#chevron"></use></svg></button>
            </div>
        
    </div>

    
        <ul class="NavigationItem-items">
            
                
                    <li class="NavigationItem-items-item"  data-click="navsub0">
    <a class="NavigationLink" href="https://myaccount2.latimes.com/index.aspx" target="_blank" rel="noopener">Manage Subscription</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub1">
    <a class="NavigationLink" href="https://myaccount2.latimes.com/login.aspx?ReturnUrl=%2fsecurepage%2fEZPay.aspx" target="_blank" rel="noopener">EZPAY</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub2">
    <a class="NavigationLink" href="https://myaccount2.latimes.com/login.aspx?ReturnUrl=%2fsecurepage%2fMissedPaper.aspx" target="_blank" rel="noopener">Delivery Issue</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub3">
    <a class="NavigationLink" href="https://enewspaper.latimes.com/  " target="_blank" rel="noopener">eNewspaper</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub4">
    <a class="NavigationLink" href="https://www.latimes.com/flyoutsubscribe" target="_blank" rel="noopener">Subscribe</a>
</li>
                
                    <li class="NavigationItem-items-item"  data-click="navsub5">
    <a class="NavigationLink" href="https://www.latimes.com/subscriber-terms-and-conditions" target="_blank" rel="noopener">Subscriber Terms</a>
</li>
                
            
        </ul>
        <ul class="NavigationItem-items-placeholder">
            
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://myaccount2.latimes.com/index.aspx" target="_blank" rel="noopener">Manage Subscription</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://myaccount2.latimes.com/login.aspx?ReturnUrl=%2fsecurepage%2fEZPay.aspx" target="_blank" rel="noopener">EZPAY</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://myaccount2.latimes.com/login.aspx?ReturnUrl=%2fsecurepage%2fMissedPaper.aspx" target="_blank" rel="noopener">Delivery Issue</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://enewspaper.latimes.com/  " target="_blank" rel="noopener">eNewspaper</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://www.latimes.com/flyoutsubscribe" target="_blank" rel="noopener">Subscribe</a>
</li>
                
                    <li class="NavigationItem-items-item">
    <a class="NavigationLink" href="https://www.latimes.com/subscriber-terms-and-conditions" target="_blank" rel="noopener">Subscriber Terms</a>
</li>
                
            
        </ul>
    
</div></li>
            
        </ul>
    
</nav>
                
                
                
                    <div class="Page-header-disclaimer">Copyright © 2020, Los Angeles Times | <a class="Link"  href="https://www.latimes.com/terms-of-service"    >Terms of Service</a> | <a class="Link"  href="https://www.latimes.com/privacy-policy"    >Privacy Policy</a> | <a class="Link"  href="https://www.latimes.com/privacy-policy#california-notice-of-collection"  target="_blank"    >CA Notice of Collection</a> | <a class="Link"  href="https://membership.latimes.com/privacy-settings"  target="_blank"    >Do Not Sell My Info</a></div>
                
            </div>
        </div>
    </div>

    <header class="Page-header">
        <button class="Page-header-menu-trigger" aria-expanded="false" tabindex="1"><svg class="burger-menu"><use xlink:href="#burger-menu"></use></svg><svg class="close-x"><use xlink:href="#close-x"></use></svg><span class="label">Sections</span></button>

        
            
                <div class="Page-header-logo"><a aria-label="home page" href="/"  >
    
        <img class="PageLogo-image" src="https://ca-times.brightspotcdn.com/b9/f5/1c9278c94a439e28f5150c679d6f/logo-full-black.svg" alt="Los Angeles Times" width="959"  height="120" />
    
    </a>
</div>
            
        

        
            <ul class="Page-header-quickLinks">
                
                    <li class="Page-header-quickLinks-item" data-click="ql0"><a class="Link"  href="https://www.latimes.com/california"    >California</a></li>
                
                    <li class="Page-header-quickLinks-item" data-click="ql1"><a class="Link"  href="https://www.latimes.com/entertainment-arts"    >Entertainment</a></li>
                
                    <li class="Page-header-quickLinks-item" data-click="ql2"><a class="Link"  href="https://www.latimes.com/sports"    >Sports</a></li>
                
                    <li class="Page-header-quickLinks-item" data-click="ql3"><a class="Link"  href="https://www.latimes.com/food"    >Food</a></li>
                
                    <li class="Page-header-quickLinks-item" data-click="ql4"><a class="Link"  href="https://www.latimes.com/environment"    >Climate </a></li>
                
                    <li class="Page-header-quickLinks-item" data-click="ql5"><a class="Link"  href="https://www.latimes.com/opinion"    >Opinion</a></li>
                
                    <li class="Page-header-quickLinks-item" data-click="ql6"><a class="Link"  href="https://placeanad.latimes.com"  target="_blank"    >|</a></li>
                
                    <li class="Page-header-quickLinks-item" data-click="ql7"><a class="Link"  href="https://placeanad.latimes.com/"  target="_blank"    >Place an Ad</a></li>
                
                    <li class="Page-header-quickLinks-item" data-click="ql8"><a class="Link"  href="https://www.latimes.com/games"    >Crossword</a></li>
                
                    <li class="Page-header-quickLinks-item" data-click="ql9"><a class="Link"  href="https://enewspaper.latimes.com/desktop/latimes/default.aspx?pubid=50435180-e58e-48b5-8e0c-236bf740270e"  target="_blank"    >eNewspaper</a></li>
                
            </ul>
        
        <div class="Page-header-end">
            <div class="dss-header bar-dss" data-reg-role="base"></div>
            
                <button class="Page-header-search-button"><svg class="icon-magnify"><use xlink:href="#icon-magnify"></use></svg><span class="sr-only">Show Search</span><svg class="close-x"><use xlink:href="#close-x"></use></svg></button>

                    <div class="Page-header-search-overlay">
                        <form class="Page-header-search-form" action="https://www.latimes.com/search#nt=navsearch" novalidate="" autocomplete="off">
                            <label><input placeholder="Search" type="text" class="Page-header-search-input" name="q" required><span class="sr-only">Search Query</span></label>
                            <button type="submit" class="Page-header-search-submit"><svg><use xlink:href="#icon-magnify"></use></svg><span class="sr-only">Submit Search</span></button>
                        </form>
                    </div>
            
        </div>
    </header>
    <div class="dss-toaster" data-reg-role="prompt"></div>
</ps-header>



    





        <div class="HomePage-header" data-target>
            <div class="HomePage-header-nameplate">
                <div class="dss-earLeft" data-reg-role="ear_left"></div>
                
                    <div class="HomePage-header-logo"><a aria-label="home page" href="/"  >
    
        <img class="PageLogo-image" src="https://ca-times.brightspotcdn.com/b9/f5/1c9278c94a439e28f5150c679d6f/logo-full-black.svg" alt="Los Angeles Times" width="959"  height="120" />
    
    </a>
</div>
                
                <div class="dss-earRight" data-reg-role="ear_right"></div>
            </div>

            <div class="HomePage-header-content">
                <div class="HomePage-header-date">May 23, 2020</div>
                
  <a class="Link" href="https://www.latimes.com/weather">
    <ps-weather-tip class="WeatherTip" data-api-key="eb8f2228a04749a8b997470e75eb4300"
     data-sub="api"
     data-zip="90245"></ps-weather-tip>
  </a>
  

            </div>
        </div>

        
    <div class="Page-above" data-click="above"><div class="GoogleDfpAd-wrapper">
    <div class="GoogleDfpAd-adCaption">Advertisement</div>
    <div id="googleAd30250018-bbbb-4f9b-82b7-40e0ba84f9ed" class="GoogleDfpAd" data-slot-name="/21787098806/web.latimes/homepage" data-slot-sizes="[[1, 1]]" data-out-of-page=true data-ptype="sectionfront" data-module-targeting='{"instart": "false"}'>
        <span class="GoogleDfpAd-placeholder"></span>
    </div>
</div>

<div class="ListP"  data-list-id="0000016a-0782-dd88-a96b-b7c3896b0001">
    

    
        <ul class="ListP-items">
            
                <li class="ListP-items-item" data-click="liP0promoButton">
                    <a class="PromoButton" aria-label="Latest rules" href="https://www.latimes.com/california/coronavirus-everything-to-know-right-now"    >Latest rules</a>

                </li>
            
                <li class="ListP-items-item" data-click="liP1promoButton">
                    <a class="PromoButton" aria-label="Things to Do" href="https://www.latimes.com/topic/things-to-do"    >Things to Do</a>

                </li>
            
                <li class="ListP-items-item" data-click="liP2promoButton">
                    <a class="PromoButton" aria-label="Recipes" href="https://www.latimes.com/food/recipes"    >Recipes</a>

                </li>
            
                <li class="ListP-items-item" data-click="liP3promoButton">
                    <a class="PromoButton" aria-label="Reopening tracker" href="https://www.latimes.com/projects/california-coronavirus-cases-tracking-outbreak/reopening-across-counties/"    >Reopening tracker</a>

                </li>
            
                <li class="ListP-items-item" data-click="liP4promoButton">
                    <a class="PromoButton" aria-label="Science " href="https://www.latimes.com/science"    >Science </a>

                </li>
            
                <li class="ListP-items-item" data-click="liP5promoButton">
                    <a class="PromoButton" aria-label="Resources &amp; Basics" href="https://www.latimes.com/topic/health"    >Resources &amp; Basics</a>

                </li>
            
        </ul>
    
</div>
</div>



        <div class="Page-ad-margins">
            <main class="HomePage-main" data-click="main">
                
                <div class="GoogleDfpAd-wrapper">
    <div class="GoogleDfpAd-adCaption">Advertisement</div>
    <div id="googleAd8dfadf1c-e6f9-40dc-abbd-23972ebd8f67" class="GoogleDfpAd" data-slot-name="/21787098806/web.latimes/homepage" data-slot-sizes="[[1280, 220], [970, 250], [970, 90], [728, 90], [320, 50]]" data-ad-type="leaderboard" data-ptype="sectionfront" data-slot-adSizeMap="[[[1241, 0], [1280, 220], [970, 250], [970, 90], [728, 90]], [[1024, 0], [728, 90], [1280, 220]], [[800, 0], [1280, 220], [728, 90]], [[0, 0], [320, 50], [320, 100], [1280, 220]]]">
        <span class="GoogleDfpAd-placeholder"></span>
    </div>
</div>

    <div class="TwoColumnContainer7030">
    
    <div class="TwoColumnContainer7030-row">
        
            <div class="TwoColumnContainer7030-column" data-click="7030col1">
                
    <div class="TwoColumnContainer7030">
    
    <div class="TwoColumnContainer7030-row">
        
            <div class="TwoColumnContainer7030-column" data-click="7030col1">
                <ps-promo class="PromoLarge"  data-content-type="article"
 data-show-img
 data-show-description
 data-hide-category
 data-hide-timestamp
 data-show-more-coverage
 data-top-center>
  <div class="PromoLarge-wrapper">
    <div class="PromoLarge-titleContainerDupe">
      

      
        
          <div class="PromoLarge-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoLarge-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/la-county-coronavirus-hot-spot-los-angeles"    >How L.A. County became a coronavirus hot spot</a>

        </div>
      
    </div>

    
      <div class="PromoLarge-media">
        
          
            <a class="Link" aria-label="How L.A. County became a coronavirus hot spot" href="https://www.latimes.com/california/story/2020-05-23/la-county-coronavirus-hot-spot-los-angeles"    >
    <img class="Image" alt="515954-la-me-neighborhoods-coronavirus26-MAM.jpg" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/5ad5aa7/2147483647/strip/true/crop/4211x2807+167+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Ff6%2F4d%2Fad08814e44b5b349777d78a2b252%2Fla-photos-1staff-515954-la-me-neighborhoods-coronavirus26-mam.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoLarge-content">
      <div class="PromoLarge-titleContainer">
        

        
          
            <div class="PromoLarge-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoLarge-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/la-county-coronavirus-hot-spot-los-angeles"    >How L.A. County became a coronavirus hot spot</a>

          </div>
        
      </div>

      
        <div class="PromoLarge-description">Theories abound as to why L.A. County has the bulk of the state’s confirmed coronavirus cases, but a clear explanation has been elusive. </div>
      

      
        
      

      <div class="PromoLarge-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590258945847"></div>

      
        <div class="PromoLarge-items">
          <div class="PromoLarge-items-title">More Coverage</div>

          
            
                <div class="PromoLarge-items-item"><a class="Link"  href="https://www.latimes.com/projects/california-coronavirus-cases-tracking-outbreak/"  target="_blank"    >Tracking coronavirus in California</a></div>
            
          
            
                <div class="PromoLarge-items-item"><a class="Link"  href="https://www.latimes.com/espanol/"  target="_blank"    >En español</a></div>
            
          
        </div>
      
    </div>
  </div>
</ps-promo>
            </div>
        
        
            <div class="TwoColumnContainer7030-column" data-click="7030col2">
                
<div class="ListF"  data-list-id="00000171-6506-dedb-affb-e526fa8a0009">
    <div class="ListF-header" data-no-title>
    
</div>


    
        <ul class="ListF-items">
            
                <li class="ListF-items-item" data-click="liF0promoSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/church-services-ban-upheld"    >Court upholds Newsom’s coronavirus ban on in-person church services in California</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Court upholds Newsom’s coronavirus ban on in-person church services in California" href="https://www.latimes.com/california/story/2020-05-23/church-services-ban-upheld"    >
    <img class="Image" alt="Huntington Beach protest" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/025c219/2147483647/strip/true/crop/840x560+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F6c%2F06%2Fe7d6a55640df94fbb10e09983f8a%2Fchurches.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/church-services-ban-upheld"    >Court upholds Newsom’s coronavirus ban on in-person church services in California</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">The 9th Circuit Court of Appeals upheld California Gov. Gavin Newsom’s ban on in-person church services due to the coronavirus crisis.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590264729483"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListF-items-item" data-click="liF1promoSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/orange-county-cleared-to-reopen-more-businesses"    >Orange County cleared to reopen more businesses amid coronavirus restrictions</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Orange County cleared to reopen more businesses amid coronavirus restrictions" href="https://www.latimes.com/california/story/2020-05-23/orange-county-cleared-to-reopen-more-businesses"    >
    <img class="Image" alt="534559_beach_activity_huntington017_LS.jpg" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/8863af3/2147483647/strip/true/crop/4800x3200+0+13/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F52%2Fd9%2Fead7881e4eff974248c2e0a3a0de%2Fla-photos-1staff-534559-beach-activity-huntington017-ls.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/orange-county-cleared-to-reopen-more-businesses"    >Orange County cleared to reopen more businesses amid coronavirus restrictions</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Orange County has been approved by the state to mount a more aggressive reopening of local businesses amid the coronavirus, officials said Saturday. </div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590269374675"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListF-items-item" data-click="liF2promoSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/politics"    >Politics</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/politics/story/2020-05-23/trump-administration-asks-supreme-court-to-stop-release-of-inmates-at-risk-for-covid-19"    >Trump administration asks Supreme Court to stop release of inmates at risk for COVID-19</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Trump administration asks Supreme Court to stop release of inmates at risk for COVID-19" href="https://www.latimes.com/politics/story/2020-05-23/trump-administration-asks-supreme-court-to-stop-release-of-inmates-at-risk-for-covid-19"    >
    <img class="Image" alt="Supreme Court " width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/c1df9af/2147483647/strip/true/crop/2048x1365+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F47%2Fa3%2F7fb03ce46198ec6dccce9117ce1a%2Fla-supreme-court-20150630" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/politics"    >Politics</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/politics/story/2020-05-23/trump-administration-asks-supreme-court-to-stop-release-of-inmates-at-risk-for-covid-19"    >Trump administration asks Supreme Court to stop release of inmates at risk for COVID-19</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">If COVID-19 poses risks to elderly inmates, may a judge order their release? Trump administration lawyers say no and ask Supreme Court to intervene.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590262298432"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListF-items-item" data-click="liF3promoSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-23/coronavirus-100-000-deaths-reopen-memorial-day-weekend"    >As U.S. coronavirus-related death toll nears 100,000, Trump hits the links </a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="As U.S. coronavirus-related death toll nears 100,000, Trump hits the links " href="https://www.latimes.com/world-nation/story/2020-05-23/coronavirus-100-000-deaths-reopen-memorial-day-weekend"    >
    <img class="Image" alt="Donald Trump" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/6d16e29/2147483647/strip/true/crop/5472x3648+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fef%2F28%2F813fb1944484bfdc23eb30116f24%2Fap20144529340533.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-23/coronavirus-100-000-deaths-reopen-memorial-day-weekend"    >As U.S. coronavirus-related death toll nears 100,000, Trump hits the links </a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Trump visited one of his private golf courses over the Memorial Day weekend while Americans faced reopenings and restrictions due to the coronavirus. </div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590268578795"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListF-items-item" data-click="liF4promoSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-bottom-center


>
                    <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-23/georgia-reopened-first-the-data-say-whatever-you-want-them-to"    >Georgia reopened first. The data say whatever you want them to </a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Georgia reopened first. The data say whatever you want them to " href="https://www.latimes.com/world-nation/story/2020-05-23/georgia-reopened-first-the-data-say-whatever-you-want-them-to"    >
    <img class="Image" alt="Bobby Contreras" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/a088d53/2147483647/strip/true/crop/5280x3520+96+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F66%2Ffd%2F2bdca375419ca188eb6480f9b272%2Fap20127846023608.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-23/georgia-reopened-first-the-data-say-whatever-you-want-them-to"    >Georgia reopened first. The data say whatever you want them to </a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Experts warn that it is too early to judge the impact of reopening after businesses were shuttered to contain the coronavirus.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590231637968"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListF-items-item" data-click="liF5promoSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/column-first-one-death-in-the-family-then-another-and-the-toll-kept-mounting-for-inglewood-couple"    >Lopez: First one death in the family, then another, and the toll kept mounting for Inglewood couple</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Lopez: First one death in the family, then another, and the toll kept mounting for Inglewood couple" href="https://www.latimes.com/california/story/2020-05-23/column-first-one-death-in-the-family-then-another-and-the-toll-kept-mounting-for-inglewood-couple"    >
    <img class="Image" alt="544912_ME-LOPEZ-COVID_KKN_19733.JPG" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/5d70b74/2147483647/strip/true/crop/6000x4000+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F44%2Ffa%2F5e38e20841fca3c468976312ced7%2Fla-photos-1staff-544912-me-lopez-covid-kkn-19733.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/column-first-one-death-in-the-family-then-another-and-the-toll-kept-mounting-for-inglewood-couple"    >Lopez: First one death in the family, then another, and the toll kept mounting for Inglewood couple</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">A healthcare activist has seen a grim example of healthcare disparities in his own family’s COVID-19 tragedies</div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590235258924"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListF-items-item" data-click="liF6promoSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/marin-county-health-officer-infected-coronavirus-antibodies"    >Marin’s health officer developed antibodies. He’s now in a unique spot to fight coronavirus</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Marin’s health officer developed antibodies. He’s now in a unique spot to fight coronavirus" href="https://www.latimes.com/california/story/2020-05-23/marin-county-health-officer-infected-coronavirus-antibodies"    >
    <img class="Image" alt="Marin health officer.jpg" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/6faa466/2147483647/strip/true/crop/2235x1490+0+134/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F0d%2F23%2F9a2be621474685f839a94c403f69%2Fmarin-health-officer.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/marin-county-health-officer-infected-coronavirus-antibodies"    >Marin’s health officer developed antibodies. He’s now in a unique spot to fight coronavirus</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Marin County’s public health officer, Matt Willis, got coronavirus. Now recovered, he has ideas on how to help Marin County residents face the disease.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590235225560"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
        </ul>
    
</div>

            </div>
        
    </div>
</div>


    <div class="OneColumnContainer" data-click="1col">
    
        <div class="OneColumnContainer-title">Reopening California</div>
    
    <div class="OneColumnContainer-row">
        
            <div class="OneColumnContainer-column">
                
<div class="ListW"  data-list-id="00000171-c6b9-de16-a57b-ffbb5ab60001">
    
        <div class="ListW-items">
            
                
                    <div class="ListW-items-item" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                        <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-22/l-a-county-reopens-bike-paths-parking-lots-at-beaches-and-allows-curbside-service-at-malls"    >L.A. County reopens bike paths, parking lots at beaches and allows curbside service at malls</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="L.A. County reopens bike paths, parking lots at beaches and allows curbside service at malls" href="https://www.latimes.com/california/story/2020-05-22/l-a-county-reopens-bike-paths-parking-lots-at-beaches-and-allows-curbside-service-at-malls"    >
    <img class="Image" alt="539567_LA-ME-LA-COUNTY-BEACHES-REOPENING_8_ALS.jpg" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/9a1c0ab/2147483647/strip/true/crop/3600x2400+0+7/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F7c%2Fb3%2F1d3b240a4552906702f3f8a700ee%2Fla-photos-1staff-539567-la-me-la-county-beaches-reopening-8-als.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-22/l-a-county-reopens-bike-paths-parking-lots-at-beaches-and-allows-curbside-service-at-malls"    >L.A. County reopens bike paths, parking lots at beaches and allows curbside service at malls</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Los Angeles County officials also give car parades and other drive-through celebrations the green light.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590179956155"></div>

      
    </div>
  </div>
</ps-promo>

                    </div>
                
            
                
                    <div class="ListW-items-item" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                        <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/california-elections-officials-suggest-schools-as-voting-sites-for-social-distancing"    >California elections officials suggest schools as voting sites for social distancing</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="California elections officials suggest schools as voting sites for social distancing" href="https://www.latimes.com/california/story/2020-05-23/california-elections-officials-suggest-schools-as-voting-sites-for-social-distancing"    >
    <img class="Image" alt="Voting in Los Angeles" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/95ee439/2147483647/strip/true/crop/1008x672+8+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F88%2F95%2F490987ac97a1b6299839800f2389%2Fla-ed-citizenship-voting-20141221-001" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/california-elections-officials-suggest-schools-as-voting-sites-for-social-distancing"    >California elections officials suggest schools as voting sites for social distancing</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Elections officials from across California say they could use schools for voting this fall if campuses could close from Friday, Oct. 30 through Wednesday, Nov. 4.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590246009390"></div>

      
    </div>
  </div>
</ps-promo>

                    </div>
                
            
                
                    <div class="ListW-items-item" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp




>
                        <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/business"    >Business</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/business/story/2020-05-22/coronavirus-reopening-preexisting-conditions-seniors-older-workers"    >If you’re older or sick, what happens to your job?</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="If you’re older or sick, what happens to your job?" href="https://www.latimes.com/business/story/2020-05-22/coronavirus-reopening-preexisting-conditions-seniors-older-workers"    >
    <img class="Image" alt="Older workers" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/ba9eb9c/2147483647/strip/true/crop/915x610+55+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fc5%2Fde%2F7a8a51d26131e4bc9c0fb4af704c%2Fla-sci-sn-employed-adults-better-health-retire-001" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/business"    >Business</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/business/story/2020-05-22/coronavirus-reopening-preexisting-conditions-seniors-older-workers"    >If you’re older or sick, what happens to your job?</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Older people and those with preexisting medical conditions face greater risk from the coronavirus. How will they return to work as businesses reopen?</div>
      

      <div class="PromoSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590172288173"></div>

      
    </div>
  </div>
</ps-promo>

                    </div>
                
            
                
                    <div class="ListW-items-item" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp




>
                        <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/travel"    >Travel</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/travel/story/2020-05-22/whats-open-and-closed-this-long-weekend-beaches-parks-and-trails-in-southern-california"    >What’s open and closed this weekend: Beaches, parks and trails</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="What’s open and closed this weekend: Beaches, parks and trails" href="https://www.latimes.com/travel/story/2020-05-22/whats-open-and-closed-this-long-weekend-beaches-parks-and-trails-in-southern-california"    >
    <img class="Image" alt="la-tr-joshuatree-camping-reopen" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/006e2ae/2147483647/strip/true/crop/5568x3712+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F0c%2Ff1%2F4ffb99bf4d659130d7f7fa5a7f47%2Fcsr4341.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/travel"    >Travel</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/travel/story/2020-05-22/whats-open-and-closed-this-long-weekend-beaches-parks-and-trails-in-southern-california"    >What’s open and closed this weekend: Beaches, parks and trails</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">As more businesses reopen, public lands follow suit</div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590246056875"></div>

      
    </div>
  </div>
</ps-promo>

                    </div>
                
            
        </div>
    
</div>

            </div>
        
    </div>
</div>



    <div class="TwoColumnContainer7030">
    
        <div class="TwoColumnContainer7030-title">Take care</div>
    
    <div class="TwoColumnContainer7030-row">
        
            <div class="TwoColumnContainer7030-column" data-click="7030col1">
                
    <div class="RichTextModule">
        
            <div class="RichTextModule-items RichTextBody"><p>2020 has forced us to stop and <b><a class="Link"  href="https://www.latimes.com/lifestyle/story/2020-05-21/weve-had-a-superbloom-spring-for-roses-here-are-expert-tips-for-continuing-the-show"    >smell the roses</a>,</b>  an activity that can help us to relax and focus on our well-being even as the pandemic changes our lives. Maybe we miss <b><a class="Link"  href="https://www.latimes.com/lifestyle/story/2020-05-20/background-noise-coronavirus-wfh-brain-hack"    >office sounds</a></b> as we work from home or <b><a class="Link"  href="https://www.latimes.com/travel/story/2020-05-21/bad-driving-shutdown-help-rusty"    >feel strange when we drive</a></b> on the freeway again.  Yet, despite the topsy-turviness, we might take time to<b> <a class="Link"  href="https://www.latimes.com/lifestyle/story/2020-05-22/play-dress-up-style-paper-dolls-summer-2020-coronavirus-fashion"    >dress up some paper dolls in summer fashion</a></b> or even dare give <b><a class="Link"  href="https://www.latimes.com/lifestyle/story/2020-05-19/haircuts-diy-meet-in-secret-coronavirus"    >ourselves a haircut</a></b>. </p></div>
        

    </div>

            </div>
        
        
            <div class="TwoColumnContainer7030-column" data-click="7030col2">
                <ps-promo class="PromoSmall"  data-content-type="article"
 data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/lifestyle"    >Lifestyle</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/lifestyle/story/2020-05-21/weve-had-a-superbloom-spring-for-roses-here-are-expert-tips-for-continuing-the-show"    >Finally, something good in 2020: A superbloom of roses</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Finally, something good in 2020: A superbloom of roses" href="https://www.latimes.com/lifestyle/story/2020-05-21/weve-had-a-superbloom-spring-for-roses-here-are-expert-tips-for-continuing-the-show"    >
    <img class="Image" alt="la-hm-ga-how-to-keep-roses-blooming-in-summer-001.JPG" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/699e6ce/2147483647/strip/true/crop/2048x1365+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F2e%2Fa5%2F2c83e01e4eaf87c2234cf18f07a2%2Fla-hm-ga-how-to-keep-roses-blooming-in-summer-001.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/lifestyle"    >Lifestyle</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/lifestyle/story/2020-05-21/weve-had-a-superbloom-spring-for-roses-here-are-expert-tips-for-continuing-the-show"    >Finally, something good in 2020: A superbloom of roses</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">It’s not your imagination: The spring of 2020 has been a superbloom year for roses and other flowers. Rose expert Tom Carruth shares his secrets for keeping roses blooming big in the summer as well. </div>
      

      <div class="PromoSmall-timestamp" data-date="May 21, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590082519647"></div>

      
    </div>
  </div>
</ps-promo>
            </div>
        
    </div>
</div>


            </div>
        
        
            <div class="TwoColumnContainer7030-column" data-click="7030col2">
                <ps-interactive-project class="InteractiveProject" use-responsive-height=false src="//www.latimes.com/projects/california-coronavirus-cases-tracking-outbreak/embedLarge/">
    	
    	<iframe  src="//www.latimes.com/projects/california-coronavirus-cases-tracking-outbreak/embedLarge/" height="420"></iframe>
    	
    </ps-interactive-project><div class="GoogleDfpAd-wrapper">
    <div class="GoogleDfpAd-adCaption">Advertisement</div>
    <div id="googleAd232b5d3a-322e-4ed5-946c-60598cfdac4c" class="GoogleDfpAd" data-slot-name="/21787098806/web.latimes/homepage" data-slot-sizes="[[300, 600], [300, 250]]" data-ad-type="mrec" data-ptype="sectionfront" data-slot-adSizeMap="[[[800, 0], [300, 600], [300, 250]], [[0, 0], [300, 250]]]">
        <span class="GoogleDfpAd-placeholder"></span>
    </div>
</div>

            </div>
        
    </div>
</div>


    <div class="TwoColumnContainer7030">
    
    <div class="TwoColumnContainer7030-row">
        
            <div class="TwoColumnContainer7030-column" data-click="7030col1">
                
<div class="ListA"  data-list-id="0000016f-e424-d31d-abef-e4f6e55c0001">
    <div class="ListA-header" >
    
        <div class="ListA-header-title">More News</div>
    
</div>


    
        <div class="ListA-items">
            
            <div class="ListA-items-column">
                
                    
                    <div class="ListA-items-item" data-show-img
 data-show-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                        <ps-promo class="PromoLarge"  data-content-type="article"
>
  <div class="PromoLarge-wrapper">
    <div class="PromoLarge-titleContainerDupe">
      

      
        
          <div class="PromoLarge-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoLarge-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/muslim-call-to-prayer-publicly-broadcast-across-southern-california"    >Mosques adapt to coronavirus shutdown by sharing the call to prayer. In Culver City, neighbors said it was too loud</a>

        </div>
      
    </div>

    
      <div class="PromoLarge-media">
        
          
            <a class="Link" aria-label="Mosques adapt to coronavirus shutdown by sharing the call to prayer. In Culver City, neighbors said it was too loud" href="https://www.latimes.com/california/story/2020-05-23/muslim-call-to-prayer-publicly-broadcast-across-southern-california"    >
    <img class="Image" alt="542437_ME_0516_Mosque_Adhan_001.IK.JPG" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/019f661/2147483647/strip/true/crop/2400x1600+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F6d%2F99%2F447ba1de46068981096489dc5e36%2Fla-photos-1staff-542437-me-0516-mosque-adhan-001.IK.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoLarge-content">
      <div class="PromoLarge-titleContainer">
        

        
          
            <div class="PromoLarge-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoLarge-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/muslim-call-to-prayer-publicly-broadcast-across-southern-california"    >Mosques adapt to coronavirus shutdown by sharing the call to prayer. In Culver City, neighbors said it was too loud</a>

          </div>
        
      </div>

      
        <div class="PromoLarge-description">Cities across Southern California have allowed mosques to broadcast the call to prayer publicly. But in Culver City, the adhan did not go unchallenged for long. </div>
      

      
        
      

      <div class="PromoLarge-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590242402559"></div>

      
    </div>
  </div>
</ps-promo>

                    </div>
                
                
                    
                
                    
                        
                            <div class="ListA-items-item" data-click="liA1promoMedium" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                              <ps-promo class="PromoMedium"  data-content-type="article"
>
  <div class="PromoMedium-wrapper">
    <div class="PromoMedium-titleContainerDupe">
      

      
        
          <div class="PromoMedium-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoMedium-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/a-big-gamble-across-southern-california-casinos-reopen-as-stay-at-home-restrictions-ease"    >As coronavirus stay-at-home restrictions ease, California casinos gamble on reopening</a>

        </div>
      
    </div>

    
      <div class="PromoMedium-media">
        
          
            <a class="Link" aria-label="As coronavirus stay-at-home restrictions ease, California casinos gamble on reopening" href="https://www.latimes.com/california/story/2020-05-23/a-big-gamble-across-southern-california-casinos-reopen-as-stay-at-home-restrictions-ease"    >
    <img class="Image" alt="544260_ME_0522_casinos_reopen_2_GMF.jpg" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/bb86def/2147483647/strip/true/crop/4134x2756+33+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F33%2F28%2Fe2c0b2204e6fa004da565e999082%2Fla-photos-1staff-544260-me-0522-casinos-reopen-2-gmf.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoMedium-content">
      <div class="PromoMedium-titleContainer">
        

        
          
            <div class="PromoMedium-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoMedium-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/a-big-gamble-across-southern-california-casinos-reopen-as-stay-at-home-restrictions-ease"    >As coronavirus stay-at-home restrictions ease, California casinos gamble on reopening</a>

          </div>
        
      </div>

      
        <div class="PromoMedium-description">On Friday, casinos across Southern California opened their doors to gamblers as some lockdown restrictions are softened. </div>
      

        
            
        

      <div class="PromoMedium-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590238821233"></div>

      
        <div class="PromoMedium-items">
          <div class="PromoMedium-items-title">More Coverage</div>

          
            
                <div class="PromoMedium-items-item"><a class="Link"  href="https://www.latimes.com/business/story/2020-05-23/card-clubs-coronavirus-reopening-plan"    >Card clubs offer reopening plan as tribal and Vegas casinos get back in the game</a></div>
            
          
            
                <div class="PromoMedium-items-item"><a class="Link"  href="https://www.latimes.com/projects/california-coronavirus-cases-tracking-outbreak/reopening-across-counties/"  target="_blank"    >Which California counties are reopening?</a></div>
            
          
        </div>
      
    </div>
  </div>
</ps-promo>

                            </div>
                        
                    
                
                    
                        
                            <div class="ListA-items-item" data-click="liA2promoMedium" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                              <ps-promo class="PromoMedium"  data-content-type="article"
>
  <div class="PromoMedium-wrapper">
    <div class="PromoMedium-titleContainerDupe">
      

      
        
          <div class="PromoMedium-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoMedium-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/san-francisco-pier-45-fire"    >Massive fire strikes San Francisco’s Fisherman’s Wharf, spares WWII ship</a>

        </div>
      
    </div>

    
      <div class="PromoMedium-media">
        
          
            <a class="Link" aria-label="Massive fire strikes San Francisco’s Fisherman’s Wharf, spares WWII ship" href="https://www.latimes.com/california/story/2020-05-23/san-francisco-pier-45-fire"    >
    <img class="Image" alt="San Francisco Pier Fire" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/5a1358e/2147483647/strip/true/crop/2402x1601+199+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F1b%2F82%2F82446e7e4afbfbe6ff82de8e67c7%2F1bbc8a71721345b1b1d6d28a83c64468" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoMedium-content">
      <div class="PromoMedium-titleContainer">
        

        
          
            <div class="PromoMedium-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoMedium-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/san-francisco-pier-45-fire"    >Massive fire strikes San Francisco’s Fisherman’s Wharf, spares WWII ship</a>

          </div>
        
      </div>

      
        <div class="PromoMedium-description">A fire broke out before dawn on San Francisco’s Pier 45 and tore through a warehouse, causing its walls to collapse, but a historic ship was saved. </div>
      

        
            
        

      <div class="PromoMedium-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590269111470"></div>

      
    </div>
  </div>
</ps-promo>

                            </div>
                        
                    
                
                    
                        
                            <div class="ListA-items-item" data-click="liA3promoMedium" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-show-more-coverage
 data-top-center


>
                              <ps-promo class="PromoMedium"  data-content-type="article"
>
  <div class="PromoMedium-wrapper">
    <div class="PromoMedium-titleContainerDupe">
      

      
        
          <div class="PromoMedium-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoMedium-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/coronavirus-testing-dodger-stadium"    >A new coronavirus testing site is opening at Dodger Stadium: What you need to know</a>

        </div>
      
    </div>

    
      <div class="PromoMedium-media">
        
          
            <a class="Link" aria-label="A new coronavirus testing site is opening at Dodger Stadium: What you need to know" href="https://www.latimes.com/california/story/2020-05-23/coronavirus-testing-dodger-stadium"    >
    <img class="Image" alt="512706-la-sp-dodgers-opening-day-plaschke2-MAM.jpg" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/b47c931/2147483647/strip/true/crop/2793x1862+4+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F54%2Ffd%2Fd466b0874202b033f013f8e8b6b8%2Fla-photos-1staff-512706-la-sp-dodgers-opening-day-plaschke2-mam.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoMedium-content">
      <div class="PromoMedium-titleContainer">
        

        
          
            <div class="PromoMedium-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoMedium-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/coronavirus-testing-dodger-stadium"    >A new coronavirus testing site is opening at Dodger Stadium: What you need to know</a>

          </div>
        
      </div>

      
        <div class="PromoMedium-description">L.A. Mayor Eric Garcetti announced a new coronavirus testing site at Dodger Stadium. Here’s what you need to know.</div>
      

        
            
        

      <div class="PromoMedium-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590261213874"></div>

      
    </div>
  </div>
</ps-promo>

                            </div>
                        
                    
                
                    
                        
                            <div class="ListA-items-item" data-click="liA4promoMedium" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-show-more-coverage
 data-top-center


>
                              <ps-promo class="PromoMedium"  data-content-type="article"
>
  <div class="PromoMedium-wrapper">
    <div class="PromoMedium-titleContainerDupe">
      

      
        
          <div class="PromoMedium-category">
            <a class="Link"  href="https://www.latimes.com/obituaries"    >Obituaries</a>
          </div>
        
      

      
        <div class="PromoMedium-title">
          
    <a class="Link"  href="https://www.latimes.com/obituaries/story/2020-05-23/william-lyon-dead-real-estate"    >William Lyon, Orange County real estate magnate who foresaw region’s growth, dies at 97</a>

        </div>
      
    </div>

    

    <div class="PromoMedium-content">
      <div class="PromoMedium-titleContainer">
        

        
          
            <div class="PromoMedium-category">
              <a class="Link"  href="https://www.latimes.com/obituaries"    >Obituaries</a>
            </div>
          
        

        
          <div class="PromoMedium-title">
            
    <a class="Link"  href="https://www.latimes.com/obituaries/story/2020-05-23/william-lyon-dead-real-estate"    >William Lyon, Orange County real estate magnate who foresaw region’s growth, dies at 97</a>

          </div>
        
      </div>

      
        <div class="PromoMedium-description">Orange County real estate magnate William Lyon, who built more than 100,000 homes nationwide and helped shape suburban America, has died at 97.</div>
      

        
            
        

      <div class="PromoMedium-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590266507081"></div>

      
    </div>
  </div>
</ps-promo>

                            </div>
                        
                    
                
                    
                        
                    
                
                    
                        
                    
                
                    
                        
                    
                
                    
                        
                    
                
                    
                        
                    
                
                    
                        
                    
                
            </div>
            <div class="ListA-items-column">
                
                    
                
                    
                
                    
                
                    
                
                    
                
                    
                        <div class="ListA-items-item" data-click="liA5promoSmall" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                          <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-23/singapore-otters-backlash"    >Coronavirus lockdown sparks a surprising backlash against otters in Singapore, the ‘Otter City’</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Coronavirus lockdown sparks a surprising backlash against otters in Singapore, the ‘Otter City’" href="https://www.latimes.com/world-nation/story/2020-05-23/singapore-otters-backlash"    >
    <img class="Image" alt="SINGAPORE-ANIMAL" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/e8046a9/2147483647/strip/true/crop/4464x2976+1+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F28%2Ffc%2F265139a5450da12db83ae1f3267b%2Fgettyimages-1126526494.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-23/singapore-otters-backlash"    >Coronavirus lockdown sparks a surprising backlash against otters in Singapore, the ‘Otter City’</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">A nomadic otter family’s raid of a private fish pond has triggered calls for a cull in a city-state that has celebrated the semiaquatic animal as one of its national mascots.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590235230426"></div>

      
    </div>
  </div>
</ps-promo>

                        </div>
                    
                
                    
                        <div class="ListA-items-item" data-click="liA6promoSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                          <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/coronavirus-memorial-day-weather-activities-social-distancing-tips"    >Memorial Day brings heat and warnings on outings in Southern California</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Memorial Day brings heat and warnings on outings in Southern California" href="https://www.latimes.com/california/story/2020-05-23/coronavirus-memorial-day-weather-activities-social-distancing-tips"    >
    <img class="Image" alt="la-tr-venice0513CR1.jpg" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/3120c0d/2147483647/strip/true/crop/5568x3712+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fdc%2F05%2F351bfb1b40d8ae1d77989f155d0a%2Fla-tr-venice0513cr1.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/coronavirus-memorial-day-weather-activities-social-distancing-tips"    >Memorial Day brings heat and warnings on outings in Southern California</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Many Southern California parks, beaches and trails will be open over Memorial Day weekend, but social distancing is being urged amid the coronavirus.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590248072656"></div>

      
    </div>
  </div>
</ps-promo>

                        </div>
                    
                
                    
                        <div class="ListA-items-item" data-click="liA7promoSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                          <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-23/turbulence-warnings-before-pakistan-plane-crash-killed-97"    >Turbulence and a warning before Pakistan plane crash that killed 97</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Turbulence and a warning before Pakistan plane crash that killed 97" href="https://www.latimes.com/world-nation/story/2020-05-23/turbulence-warnings-before-pakistan-plane-crash-killed-97"    >
    <img class="Image" alt="APTOPIX Pakistan Plane Crash" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/872f6a8/2147483647/strip/true/crop/4610x3073+0+40/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fca%2F5b%2F9f341ff03bc314b832dddf6d27bb%2Fffee42761045446bbdf6b358bee6dc2b" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-23/turbulence-warnings-before-pakistan-plane-crash-killed-97"    >Turbulence and a warning before Pakistan plane crash that killed 97</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">One of the two survivors of the Pakistan plane crash near Karachi said the flight proceeded normally until its descent, when there was a sudden jolt. </div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590245271464"></div>

      
    </div>
  </div>
</ps-promo>

                        </div>
                    
                
                    
                        <div class="ListA-items-item" data-click="liA8promoSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                          <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/sports"    >Sports</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/sports/story/2020-05-23/nba-says-it-is-talking-with-disney-about-resuming-season-in-florida"    >NBA says it is talking with Disney about resuming season in Florida</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="NBA says it is talking with Disney about resuming season in Florida" href="https://www.latimes.com/sports/story/2020-05-23/nba-says-it-is-talking-with-disney-about-resuming-season-in-florida"    >
    <img class="Image" alt="APphoto_Pistons 76ers Basketball" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/c72388f/2147483647/strip/true/crop/5040x3360+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fbb%2F55%2Fc9a4661b453787452ff7b27bacf2%2Fapphoto-pistons-76ers-basketball2.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/sports"    >Sports</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/sports/story/2020-05-23/nba-says-it-is-talking-with-disney-about-resuming-season-in-florida"    >NBA says it is talking with Disney about resuming season in Florida</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">The NBA is in talks with Walt Disney Co. on a single-site scenario for a resumption of play in Central Florida in late July.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590257052862"></div>

      
    </div>
  </div>
</ps-promo>

                        </div>
                    
                
                    
                        <div class="ListA-items-item" data-click="liA9promoSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                          <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/politics"    >Politics</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/politics/story/2020-05-23/jeff-sessions-trump-russia-investigation"    >Jeff Sessions fires back after Trump tweets about his Russia investigation recusal</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Jeff Sessions fires back after Trump tweets about his Russia investigation recusal" href="https://www.latimes.com/politics/story/2020-05-23/jeff-sessions-trump-russia-investigation"    >
    <img class="Image" alt="Jeff Sessions" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/daaffff/2147483647/strip/true/crop/1993x1329+27+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F4e%2Fec%2F781a329786f7689cb04a21ab0d7d%2Fla-jeff-sessions-20170302" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/politics"    >Politics</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/politics/story/2020-05-23/jeff-sessions-trump-russia-investigation"    >Jeff Sessions fires back after Trump tweets about his Russia investigation recusal</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">The family of slain Washington Post columnist Jamal Khashoggi gave legal reprieve to the five government agents convicted of his murder who’d been sentenced to execution.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590246938439"></div>

      
    </div>
  </div>
</ps-promo>

                        </div>
                    
                
                    
                        <div class="ListA-items-item" data-click="liA10promoSmall" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                          <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/entertainment-arts/tv"    >Television</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/tv/story/2020-05-22/lana-del-rey-alison-roman-mrs-america-white-female-privilege"    >Lana Del Rey and Alison Roman flaunted white women’s privilege. But they’re not alone</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Lana Del Rey and Alison Roman flaunted white women’s privilege. But they’re not alone" href="https://www.latimes.com/entertainment-arts/tv/story/2020-05-22/lana-del-rey-alison-roman-mrs-america-white-female-privilege"    >
    <img class="Image" alt="466965_ca_lana_del_rey_JLC" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/9f01f73/2147483647/strip/true/crop/6234x4156+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F2d%2F99%2Fdbdda2c5421b962fe46895e5f6b4%2F466965-ca-0926-lana-del-rey-jlc-17252.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/entertainment-arts/tv"    >Television</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/tv/story/2020-05-22/lana-del-rey-alison-roman-mrs-america-white-female-privilege"    >Lana Del Rey and Alison Roman flaunted white women’s privilege. But they’re not alone</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">As “Mrs. America” shows, the white female privilege displayed by Lana Del Rey and Alison Roman in recent spats is larger, and older, than either of them.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590190443547"></div>

      
    </div>
  </div>
</ps-promo>

                        </div>
                    
                
            </div>
        </div>
    
</div>

    <div class="TwoColumnContainer5050">
    
    <div class="TwoColumnContainer5050-row">
        
            <div class="TwoColumnContainer5050-column" data-click="5050col1">
                <ps-promo class="PromoMedium"  data-content-type="longForm"

 data-hide-description
 data-hide-category
 data-hide-timestamp

>
  <div class="PromoMedium-wrapper">
    <div class="PromoMedium-titleContainerDupe">
      

      
        
          <div class="PromoMedium-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoMedium-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/saugus-seniors-coronavirus-class-2020"    >Column One: They survived a school shooting. Then coronavirus stole Saugus High’s senior year</a>

        </div>
      
    </div>

    
      <div class="PromoMedium-media">
        
          
            <a class="Link" aria-label="Column One: They survived a school shooting. Then coronavirus stole Saugus High’s senior year" href="https://www.latimes.com/california/story/2020-05-23/saugus-seniors-coronavirus-class-2020"    >
    <img class="Image" alt="541552_ME-SAUGUS-HIGH-SENIORS-SHOOTING-CORONAVIRUS_03_MJC.jpg" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/0779340/2147483647/strip/true/crop/6720x4480+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fe9%2F63%2F957fdb3740409fb0ad7db593299d%2Fla-photos-1staff-541552-me-saugus-high-seniors-shooting-coronavirus-03-mjc.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoMedium-content">
      <div class="PromoMedium-titleContainer">
        

        
          
            <div class="PromoMedium-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoMedium-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/saugus-seniors-coronavirus-class-2020"    >Column One: They survived a school shooting. Then coronavirus stole Saugus High’s senior year</a>

          </div>
        
      </div>

      
        <div class="PromoMedium-description">When Adam Bratt studied the faces of his Advanced Placement psychology students that morning in December, he saw trauma. </div>
      

        
            
        

      <div class="PromoMedium-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590235225142"></div>

      
    </div>
  </div>
</ps-promo>
            </div>
        
        
            <div class="TwoColumnContainer5050-column" data-click="5050col2">
                <ps-promo class="PromoMedium"  data-content-type="longForm"

 data-hide-description
 data-hide-category
 data-hide-timestamp

>
  <div class="PromoMedium-wrapper">
    <div class="PromoMedium-titleContainerDupe">
      

      
        
          <div class="PromoMedium-category">
            <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
          </div>
        
      

      
        <div class="PromoMedium-title">
          
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-22/one-newspaper-never-forgot-the-tulsa-race-massacre"    >This newspaper has never forgotten the 1921 Tulsa Race Massacre — and its fight continues </a>

        </div>
      
    </div>

    
      <div class="PromoMedium-media">
        
          
            <a class="Link" aria-label="This newspaper has never forgotten the 1921 Tulsa Race Massacre — and its fight continues " href="https://www.latimes.com/world-nation/story/2020-05-22/one-newspaper-never-forgot-the-tulsa-race-massacre"    >
    <img class="Image" alt="LA TIME TULSA" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/7112236/2147483647/strip/true/crop/1900x1267+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fd5%2F70%2F0d8a81e747c08b1c40377d137b39%2Fla-na-tulsa-race-riots-mass-graves.43.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoMedium-content">
      <div class="PromoMedium-titleContainer">
        

        
          
            <div class="PromoMedium-category">
              <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
            </div>
          
        

        
          <div class="PromoMedium-title">
            
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-22/one-newspaper-never-forgot-the-tulsa-race-massacre"    >This newspaper has never forgotten the 1921 Tulsa Race Massacre — and its fight continues </a>

          </div>
        
      </div>

      
        <div class="PromoMedium-description">A black-owned Oklahoma newspaper would not let the state forget the day white mobs murdered hundreds of African Americans in Tulsa. </div>
      

        
            
        

      <div class="PromoMedium-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590145235913"></div>

      
    </div>
  </div>
</ps-promo>
            </div>
        
    </div>
</div>


<div class="ListG"  data-list-id="0000016f-fda4-dfb0-abff-ffaf19c20008">
    <div class="ListG-header" >
    
        <div class="ListG-header-title"><a href="https://www.latimes.com/entertainment-arts" >Entertainment &amp; Arts<svg class="chevron"><use xlink:href="#chevron"></use></svg></a></div>
    
</div>


    
        <div class="ListG-items">
            
            <div class="ListG-items-column">
                
                    <div class="ListG-items-item" data-click="liG0promoMedium" data-show-img
 data-show-description
 data-hide-category
 data-hide-timestamp

 data-top-center


>
                        <ps-promo class="PromoMedium"  data-content-type="article"
>
  <div class="PromoMedium-wrapper">
    <div class="PromoMedium-titleContainerDupe">
      

      
        
          <div class="PromoMedium-category">
            <a class="Link"  href="https://www.latimes.com/entertainment-arts/movies"    >Movies</a>
          </div>
        
      

      
        <div class="PromoMedium-title">
          
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/movies/story/2020-05-23/full-monty-director-peter-cattaneo-military-wives"    >23 years after the sleeper success of ‘The Full Monty,’ Peter Cattaneo turns to ‘Military Wives’</a>

        </div>
      
    </div>

    
      <div class="PromoMedium-media">
        
          
            <a class="Link" aria-label="23 years after the sleeper success of ‘The Full Monty,’ Peter Cattaneo turns to ‘Military Wives’" href="https://www.latimes.com/entertainment-arts/movies/story/2020-05-23/full-monty-director-peter-cattaneo-military-wives"    >
    <img class="Image" alt="Kristen Scott Thomas Sharon Hogan LA Times" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/dfa5517/2147483647/strip/true/crop/2500x1667+0+101/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F58%2F46%2F9b48d9fa47658440d7001344f6ac%2F493380-la-ca-military-wives-cp-367.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoMedium-content">
      <div class="PromoMedium-titleContainer">
        

        
          
            <div class="PromoMedium-category">
              <a class="Link"  href="https://www.latimes.com/entertainment-arts/movies"    >Movies</a>
            </div>
          
        

        
          <div class="PromoMedium-title">
            
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/movies/story/2020-05-23/full-monty-director-peter-cattaneo-military-wives"    >23 years after the sleeper success of ‘The Full Monty,’ Peter Cattaneo turns to ‘Military Wives’</a>

          </div>
        
      </div>

      
        <div class="PromoMedium-description">Peter Cattaneo earned an Oscar nomination for ‘The Full Monty’ and then couldn’t figure out what to do next. He’s back 23 years later with the British choir comedy ‘Military Wives.’</div>
      

        
            
        

      <div class="PromoMedium-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590235227086"></div>

      
    </div>
  </div>
</ps-promo>

                    </div>
                
            </div>
            <div class="ListG-items-column">
                
                    
                
                    
                        
                            <div class="ListG-items-item" data-click="liG1promoSmall" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                                <ps-promo class="PromoSmall"  data-content-type="storyStack"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/entertainment-arts/movies"    >Movies</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/movies/story/2020-05-22/cannes-film-festival-canceled-best-films"    >Cannes 2020 is canceled. 28 of the festival’s best films you can stream right now</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Cannes 2020 is canceled. 28 of the festival’s best films you can stream right now" href="https://www.latimes.com/entertainment-arts/movies/story/2020-05-22/cannes-film-festival-canceled-best-films"    >
    <img class="Image" alt="Kristen Stewart stars in “Personal Shopper.”
" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/7b3d005/2147483647/strip/true/crop/864x576+80+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fb6%2Fcd%2F71b577a7ddb80df89d06914ad290%2Fla-1463604975-snap-photo" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/entertainment-arts/movies"    >Movies</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/movies/story/2020-05-22/cannes-film-festival-canceled-best-films"    >Cannes 2020 is canceled. 28 of the festival’s best films you can stream right now</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Check out these underseen gems from the Cannes Film Festival, which had to cancel its 2020 edition due to COVID-19.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590170164221"></div>

      
    </div>
  </div>
</ps-promo>

                            </div>
                        
                    
                
                    
                        
                            <div class="ListG-items-item" data-click="liG2promoSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                                <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/entertainment-arts"    >Entertainment &amp; Arts</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/story/2020-05-23/hana-kimura-dies-netflix-terrace-house-cyberbullying"    >Why some fans of Netflix reality-show star Hana Kimura blame her death on cyberbullying </a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Why some fans of Netflix reality-show star Hana Kimura blame her death on cyberbullying " href="https://www.latimes.com/entertainment-arts/story/2020-05-23/hana-kimura-dies-netflix-terrace-house-cyberbullying"    >
    <img class="Image" alt="Hana Kimura.jpg" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/9702649/2147483647/strip/true/crop/750x500+146+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F92%2F82%2F625ca7a6490cbf361fd58643584a%2Fhana-kimura.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/entertainment-arts"    >Entertainment &amp; Arts</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/story/2020-05-23/hana-kimura-dies-netflix-terrace-house-cyberbullying"    >Why some fans of Netflix reality-show star Hana Kimura blame her death on cyberbullying </a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Hana Kimura, a 22-year-old Japanese pro wrestler and star of Netflix’s ‘Terrace House,’ dies after social media backlash over her behavior on the show.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590266250168"></div>

      
    </div>
  </div>
</ps-promo>

                            </div>
                        
                    
                
                    
                        
                            <div class="ListG-items-item" data-click="liG3promoSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                                <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/entertainment-arts/business"    >Company Town</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/business/story/2020-05-22/coronavirus-georgia-reopening-movie-tv-production-guidelines-for-film-sets"    >Camera tricks, actor barriers and no fruit platters: Georgia’s recommendations for film sets</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Camera tricks, actor barriers and no fruit platters: Georgia’s recommendations for film sets" href="https://www.latimes.com/entertainment-arts/business/story/2020-05-22/coronavirus-georgia-reopening-movie-tv-production-guidelines-for-film-sets"    >
    <img class="Image" alt="Tyler Perry" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/a7cb7d5/2147483647/strip/true/crop/476x317+12+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fa0%2F79%2F611313c915600f47d2adb9e8508b%2Flat-fi-lionsgate-kevnznc" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/entertainment-arts/business"    >Company Town</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/business/story/2020-05-22/coronavirus-georgia-reopening-movie-tv-production-guidelines-for-film-sets"    >Camera tricks, actor barriers and no fruit platters: Georgia’s recommendations for film sets</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Georgia becomes the first state to release guidelines for film and TV sets to reduce the risk of spreading COVID-19. No open calls and, for craft services: prepackaged, individual portions only.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590168241341"></div>

      
    </div>
  </div>
</ps-promo>

                            </div>
                        
                    
                
            </div>
            
        </div>
    
</div>

<div class="ListE"  data-list-id="00000171-64eb-dc89-adfd-77fb824f000e">
    <div class="ListE-header" >
    
        <div class="ListE-header-title"><a href="https://www.latimes.com/california/story/2020-03-27/coronavirus-visuals" >The crisis in photos<svg class="chevron"><use xlink:href="#chevron"></use></svg></a></div>
    
</div>


    
        <ul class="ListE-items">
            
                <li class="ListE-items-item" data-click="liE0promoSmall"
 data-hide-description
 data-hide-category
 data-hide-timestamp

 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="storyGallery"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-03-27/coronavirus-visuals"    >A visual look at the coronavirus crisis</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="A visual look at the coronavirus crisis" href="https://www.latimes.com/california/story/2020-03-27/coronavirus-visuals"    >
    <img class="Image" alt="541722_LA-ME-INFECTION-DISPARITIES-LA-COUNTY_4_ALS.jpg" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/15b6c22/2147483647/strip/true/crop/3471x2314+65+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F75%2F83%2F80641a34493895e8cedd247de7f4%2Fla-photos-1staff-541722-la-me-infection-disparities-la-county-4-als.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-03-27/coronavirus-visuals"    >A visual look at the coronavirus crisis</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Los Angeles Times’ visual coverage of the coronavirus crisis</div>
      

      <div class="PromoSmall-timestamp" data-date="April 30, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1588262415278"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListE-items-item" data-click="liE1promoSmall"
 data-hide-description
 data-hide-category
 data-hide-timestamp

 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="longForm"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-21/on-the-front-line-paramedics-in-tijuana"    >In Tijuana, paramedics risk their lives to help the sick</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="In Tijuana, paramedics risk their lives to help the sick" href="https://www.latimes.com/california/story/2020-05-21/on-the-front-line-paramedics-in-tijuana"    >
    <img class="Image" alt="RED CROSS AMBULANCE CORONAVIRUS TIJUANA MEXICO CRUZ ROJA" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/48c6256/2147483647/strip/true/crop/6000x4000+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F8a%2Fe1%2F82ae1dc743a4a95d4e2ce9150505%2Fla-photos-1staff-536942-me-0505-redcross-mwy-1968.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-21/on-the-front-line-paramedics-in-tijuana"    >In Tijuana, paramedics risk their lives to help the sick</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">The coronavirus is killing so many people in Tijuana that the morgue has run out of refrigerator space for bodies. </div>
      

      <div class="PromoSmall-timestamp" data-date="May 21, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590066007570"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListE-items-item" data-click="liE2promoSmall"
 data-hide-description
 data-hide-category
 data-hide-timestamp

 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="longForm"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-16/coronavirus-phase-2-reopening-california-photos"    >Phase 2 of reopening: Striking photos from around California</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Phase 2 of reopening: Striking photos from around California" href="https://www.latimes.com/california/story/2020-05-16/coronavirus-phase-2-reopening-california-photos"    >
    <img class="Image" alt="544054_ME-CASH-DURING-CORONAVIRUS_01_MJC.jpg" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/3af2a82/2147483647/strip/true/crop/4000x2667+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fd4%2Ff3%2Ffdc2113a455396002be3cfd4fdef%2Fla-photos-1staff-544054-me-cash-during-coronavirus-01-mjc.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-16/coronavirus-phase-2-reopening-california-photos"    >Phase 2 of reopening: Striking photos from around California</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Visual look at the second phase to reopen California amid the coronavirus outbreak.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 16, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1589644022102"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
        </ul>
    
</div>

            </div>
        
        
            <div class="TwoColumnContainer7030-column" data-click="7030col2">
                
<div class="ListL"  data-list-id="00000170-d668-d0a4-ad78-f66fdaba0001">
    <div class="ListL-header" >
    
        <div class="ListL-header-title"><a href="https://www.latimes.com/about/free-coronavirus-coverage" >Free for all readers<svg class="chevron"><use xlink:href="#chevron"></use></svg></a></div>
    
</div>


    
        <ul class="ListL-items">
            
                <li class="ListL-items-item" data-click="liL0promoXSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage



>
                    <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/science"    >Science</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/science/newsletter/2020-05-22/grief-churches-nursing-homes-coronavirus-today"    >📫 Newsletter: Where’s America’s shared grief?</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="📫 Newsletter: Where’s America’s shared grief?" href="https://www.latimes.com/science/newsletter/2020-05-22/grief-churches-nursing-homes-coronavirus-today"    >
    <img class="Image" alt="Four Muslim Funerals Held In One Day At NYC Islamic Center Amid COVID-19 Pandemic" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/5664d25/2147483647/strip/true/crop/5519x3605+0+37/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F76%2Fe6%2Fba4be37646c983e2bcab4ca2c5a1%2Fhttps-delivery.gettyimages.com%2Fdownloads%2F1223846458.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/science"    >Science</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/science/newsletter/2020-05-22/grief-churches-nursing-homes-coronavirus-today"    >📫 Newsletter: Where’s America’s shared grief?</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">A special Friday newsletter edition to equip you for the holiday weekend and get you up to date on what’s happening, from Americans’ lack of collective mourning to Los Angeles County’s scaled-back plans for testing in nursing homes.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590199888935"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListL-items-item" data-click="liL1promoXSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage



>
                    <ps-promo class="PromoXSmall"  data-content-type="storyStack"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/coronavirus-everything-to-know-right-now"    >🗞️ What to know about California reopening</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="🗞️ What to know about California reopening" href="https://www.latimes.com/california/coronavirus-everything-to-know-right-now"    >
    <img class="Image" alt="544025_la-me-signmakers-coronavirus_3_AJS.jpg" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/b95e802/2147483647/strip/true/crop/3600x2351+0+24/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fb4%2F1c%2F150239214b5ea44357c58ba0bfaf%2Fla-photos-1staff-544025-la-me-signmakers-coronavirus-3-ajs.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/coronavirus-everything-to-know-right-now"    >🗞️ What to know about California reopening</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Trying to get a handle on how and when California might reopen? Our guide includes the latest updates and tips for remaining healthy and sane. </div>
      

      

      <div class="PromoXSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590162841478"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
        </ul>
    
</div>

    <div class="OneColumnContainer" data-click="1col">
    
    <div class="OneColumnContainer-row">
        
            <div class="OneColumnContainer-column">
                
<div class="ListL"  data-list-id="00000171-c8ad-d9ac-ab7b-d9bff77c0001">
    <div class="ListL-header" >
    
        <div class="ListL-header-title">Podcasts</div>
    
</div>


    
        <ul class="ListL-items">
            
                <li class="ListL-items-item" data-click="liL0promoXSmall" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                    <ps-promo class="PromoXSmall"  data-content-type="longForm"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/entertainment-arts/tv"    >Television</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/tv/story/2020-04-29/cant-stop-watching-podcast-tv-shows"    >Catch up with ‘Better Things’ star Pamela Adlon on ‘Can’t Stop Watching’</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Catch up with ‘Better Things’ star Pamela Adlon on ‘Can’t Stop Watching’" href="https://www.latimes.com/entertainment-arts/tv/story/2020-04-29/cant-stop-watching-podcast-tv-shows"    >
    <img class="Image" alt="Can’t Stop Watching image" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/8f772b2/2147483647/strip/true/crop/9000x5878+0+61/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fca%2Fdd%2F78dc56b3400699621c6d1f094038%2Fla20-catchstopwatching-9000x6000-fnl.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/entertainment-arts/tv"    >Television</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/tv/story/2020-04-29/cant-stop-watching-podcast-tv-shows"    >Catch up with ‘Better Things’ star Pamela Adlon on ‘Can’t Stop Watching’</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Hear interviews with TV stars in new podcast ‘Can’t Stop Watching’</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 18, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1589832924266"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListL-items-item" data-click="liL1promoXSmall" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-right


>
                    <ps-promo class="PromoXSmall"  data-content-type="longForm"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-20/betty-broderick-murders-podcast"    >New: 30 years later, we reexamine the Betty Broderick murders</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="New: 30 years later, we reexamine the Betty Broderick murders" href="https://www.latimes.com/california/story/2020-05-20/betty-broderick-murders-podcast"    >
    <img class="Image" alt="Itwassimple_3x2_FINAL.jpg" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/ac5ea9b/2147483647/strip/true/crop/1079x705+0+15/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fa1%2F7e%2Fbcf115a645e89990e78e48600995%2Fitwassimple-3x2-final.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-20/betty-broderick-murders-podcast"    >New: 30 years later, we reexamine the Betty Broderick murders</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">‘It Was Simple: The Betty Broderick Murders’ is a podcast hosted by columnist and reporter Patt Morrison.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 20, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1589972457170"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListL-items-item" data-click="liL2promoXSmall" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-right


>
                    <ps-promo class="PromoXSmall"  data-content-type="longForm"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/coronaviruspodcast"    >‘Coronavirus in California’: Sympathy for the Mom-and-Pop Landlord</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="‘Coronavirus in California’: Sympathy for the Mom-and-Pop Landlord" href="https://www.latimes.com/coronaviruspodcast"    >
    <img class="Image" alt="la-me-coronavirus-in-california-podcast copy.jpg" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/a9e7765/2147483647/strip/true/crop/9000x5878+0+61/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fee%2Fd3%2F3c325f0f4a6a8de2e8a6e63feae8%2Fla-me-coronavirus-in-california-podcast-copy.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/coronaviruspodcast"    >‘Coronavirus in California’: Sympathy for the Mom-and-Pop Landlord</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">From the Los Angeles Times: Coronavirus in California: Stories From the Front Line is a daily 15-minute podcast hosted by reporter Gustavo Arellano. </div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="April 7, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1586257202253"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListL-items-item" data-click="liL3promoXSmall" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-right


>
                    <ps-promo class="PromoXSmall"  data-content-type="longForm"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-03-10/asian-enough-podcast"    >‘Asian Enough’: Sung Kang on his return to Fast and the Furious</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="‘Asian Enough’: Sung Kang on his return to Fast and the Furious" href="https://www.latimes.com/california/story/2020-03-10/asian-enough-podcast"    >
    <img class="Image" alt="asianenough.jpg.jpg" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/36c3e50/2147483647/strip/true/crop/3000x1959+0+20/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F18%2F16%2Fa17a23f94a268c08332ff6f10716%2Fasianenough.jpg.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-03-10/asian-enough-podcast"    >‘Asian Enough’: Sung Kang on his return to Fast and the Furious</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">“Asian Enough” is a podcast about being Asian American — with guests like John Cho, Lulu Wang, Mina Kimes, Margaret Cho and Padma Lakshmi.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="March 10, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1583834414650"></div>

      
        <div class="PromoXSmall-items">
          <div class="PromoXSmall-items-title">More Coverage</div>

          
            
                <div class="PromoXSmall-items-item"><a class="Link"  href="https://www.latimes.com/california/story/2020-03-10/asian-enough-why"    >Shyong: On a new podcast about Asian American identity, we talk about the struggle to feel we’re ‘enough’</a></div>
            
          
        </div>
      
    </div>
  </div>
</ps-promo>

                </li>
            
        </ul>
    
</div>

            </div>
        
    </div>
</div>


<div class="GoogleDfpAd-wrapper">
    <div class="GoogleDfpAd-adCaption">Advertisement</div>
    <div id="googleAd80aa6ff4-85e0-428e-8e6b-9d5352b0e4ea" class="GoogleDfpAd" data-slot-name="/21787098806/web.latimes/homepage" data-slot-sizes="[[300, 600], [300, 250]]" data-ad-type="mrec" data-ptype="sectionfront" data-slot-adSizeMap="[[[1024, 0], [300, 600], [300, 250]], [[0, 0], [300, 250]]]">
        <span class="GoogleDfpAd-placeholder"></span>
    </div>
</div>

<div class="ListL"  data-list-id="0000016a-0df8-df32-abfb-4df9696b0001">
    <div class="ListL-header" >
    
        <div class="ListL-header-title"><a href="https://www.latimes.com/opinion" >Opinion<svg class="chevron"><use xlink:href="#chevron"></use></svg></a></div>
    
</div>


    
        <ul class="ListL-items">
            
                <li class="ListL-items-item" data-click="liL0promoXSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage



>
                    <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/opinion"    >Opinion</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/opinion/story/2020-05-10/reimagine-california-after-the-coronavirus-pandemic"    >California will never be the same. Tell us what you want to see change after the coronavirus pandemic</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="California will never be the same. Tell us what you want to see change after the coronavirus pandemic" href="https://www.latimes.com/opinion/story/2020-05-10/reimagine-california-after-the-coronavirus-pandemic"    >
    <img class="Image" alt="Reimagine California Photo Illustration" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/66188b5/2147483647/strip/true/crop/4697x3068+0+32/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fe0%2F97%2Ff4449e3e4e80b2b4a878c27acc6b%2Freimagine-california.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/opinion"    >Opinion</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/opinion/story/2020-05-10/reimagine-california-after-the-coronavirus-pandemic"    >California will never be the same. Tell us what you want to see change after the coronavirus pandemic</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Help the Los Angeles Times reimagine what California should look like after the COVID-19 pandemic ends.</div>
      

      

      <div class="PromoXSmall-timestamp" data-date="May 10, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1589122814743"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListL-items-item" data-click="liL1promoXSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage



>
                    <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/opinion"    >Opinion</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/opinion/story/2020-05-11/opinion-la-covid-19-ha-transformado-nuestro-estado-diganos-como-mejorarlo"    >Opinion: La COVID-19 ha transformado nuestro estado. Díganos cómo mejorarlo</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Opinion: La COVID-19 ha transformado nuestro estado. Díganos cómo mejorarlo" href="https://www.latimes.com/opinion/story/2020-05-11/opinion-la-covid-19-ha-transformado-nuestro-estado-diganos-como-mejorarlo"    >
    <img class="Image" alt="Long Angeles closed due to Coronavirus" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/5a4fca7/2147483647/strip/true/crop/4697x3068+0+32/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F89%2Fb5%2F3d4ceffa4e3085b95fc2eaa771d2%2Fredisenando-calif.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/opinion"    >Opinion</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/opinion/story/2020-05-11/opinion-la-covid-19-ha-transformado-nuestro-estado-diganos-como-mejorarlo"    >Opinion: La COVID-19 ha transformado nuestro estado. Díganos cómo mejorarlo</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">El equipo de opinión de Los Angeles Times está tratando de imaginar cómo debería ser el sur de California, el estado y la nación después de la pandemia. </div>
      

      

      <div class="PromoXSmall-timestamp" data-date="May 11, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1589223203589"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListL-items-item" data-click="liL2promoXSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage



>
                    <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/opinion"    >Opinion</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/opinion/story/2020-05-23/trump-press-attack-coverage"    >Column: The Trump attack machine reaches new levels of hysteria. Is there anything to be done about it?</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Column: The Trump attack machine reaches new levels of hysteria. Is there anything to be done about it?" href="https://www.latimes.com/opinion/story/2020-05-23/trump-press-attack-coverage"    >
    <img class="Image" alt="US-POLITICS-TRUMP" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/2d6f2d1/2147483647/strip/true/crop/1762x1151+142+0/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fa3%2F00%2F9295c97a6f45e3bf7767fc016ebf%2Fla-1537638645-uuokc1kxqk-snap-image" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/opinion"    >Opinion</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/opinion/story/2020-05-23/trump-press-attack-coverage"    >Column: The Trump attack machine reaches new levels of hysteria. Is there anything to be done about it?</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">The Trump attack machine is gearing up for the final stretch of the 2020 campaign. Let’s hope the media doesn’t take him seriously.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590231612815"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListL-items-item" data-click="liL3promoXSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage



>
                    <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/opinion"    >Opinion</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/opinion/story/2020-05-23/column-karen-meme-white-women-behaving-badly"    >Column: Is the ‘Karen’ meme sexist? Maybe, but it’s also apt</a>

        </div>
      
    </div>

    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/opinion"    >Opinion</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/opinion/story/2020-05-23/column-karen-meme-white-women-behaving-badly"    >Column: Is the ‘Karen’ meme sexist? Maybe, but it’s also apt</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">The “Karen” meme has taken on new meaning during the coronavirus crisis as a label for someone who feels entitled to prioritize her own desires over public safety</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590228631587"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
        </ul>
    
</div>

<div class="ListL"  data-list-id="0000016b-7620-d6eb-adeb-76b125d80001">
    <div class="ListL-header" >
    
        <div class="ListL-header-title"><a href="https://www.latimes.com/espanol/" >L.A. Times en Español<svg class="chevron"><use xlink:href="#chevron"></use></svg></a></div>
    
</div>


    
        <ul class="ListL-items">
            
                <li class="ListL-items-item" data-click="liL0promoXSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage



>
                    <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/espanol/california"    >California</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/espanol/california/articulo/2020-05-23/alrededor-de-4-millones-de-empleos-en-el-sur-de-california-pueden-estar-en-riesgo-debido-al-coronavirus-segun-un-reporte"    >Alrededor de 4 millones de empleos en el Sur de California pueden estar en riesgo </a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Alrededor de 4 millones de empleos en el Sur de California pueden estar en riesgo " href="https://www.latimes.com/espanol/california/articulo/2020-05-23/alrededor-de-4-millones-de-empleos-en-el-sur-de-california-pueden-estar-en-riesgo-debido-al-coronavirus-segun-un-reporte"    >
    <img class="Image" alt="526457_ME_0417_FOOD_GIVE_AWAY_GEM_GEM_013.jpg" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/426f5f2/2147483647/strip/true/crop/5760x3762+0+39/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F20%2F81%2Faa1e34864805951ae44f1ffc5689%2Fla-photos-1staff-526457-me-0417-food-give-away-gem-gem-013.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/espanol/california"    >California</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/espanol/california/articulo/2020-05-23/alrededor-de-4-millones-de-empleos-en-el-sur-de-california-pueden-estar-en-riesgo-debido-al-coronavirus-segun-un-reporte"    >Alrededor de 4 millones de empleos en el Sur de California pueden estar en riesgo </a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">La región se enfrenta a un panorama económico nefasto en los próximos dos años.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590239220197"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListL-items-item" data-click="liL1promoXSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage



>
                    <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/espanol/mexico"    >México</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/espanol/mexico/articulo/2020-05-23/en-tijuana-los-paramedicos-descubren-un-numero-oculto-de-muertes-que-no-se-captura-en-las-estadisticas-de-covid-19"    >En Tijuana, los paramédicos descubren un número oculto de muertes que no figuran en las estadísticas de COVID-19</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="En Tijuana, los paramédicos descubren un número oculto de muertes que no figuran en las estadísticas de COVID-19" href="https://www.latimes.com/espanol/mexico/articulo/2020-05-23/en-tijuana-los-paramedicos-descubren-un-numero-oculto-de-muertes-que-no-se-captura-en-las-estadisticas-de-covid-19"    >
    <img class="Image" alt="536942_ME_0505_REDCROSS_MWY_1819.JPG" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/93032cc/2147483647/strip/true/crop/6000x3919+0+41/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Ff3%2Fbd%2Fc06ba939439d8cd5ef37c8136301%2Fla-photos-1staff-536942-me-0505-redcross-mwy-1819.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/espanol/mexico"    >México</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/espanol/mexico/articulo/2020-05-23/en-tijuana-los-paramedicos-descubren-un-numero-oculto-de-muertes-que-no-se-captura-en-las-estadisticas-de-covid-19"    >En Tijuana, los paramédicos descubren un número oculto de muertes que no figuran en las estadísticas de COVID-19</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Investigadores de la UCLA y de México encuentran un aumento dramático en las muertes fuera del hospital en Tijuana.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590239234176"></div>

      
        <div class="PromoXSmall-items">
          <div class="PromoXSmall-items-title">More Coverage</div>

          
            
                <div class="PromoXSmall-items-item"><a class="Link"  href="https://www.latimes.com/espanol/eeuu/articulo/2020-05-23/existe-poca-sensacion-de-pena-compartida-por-los-muertos-de-covid-19-al-acercarse-la-cifra-a-100-000"    >Existe poca sensación de pena compartida por los muertos de Covid-19 al acercarse la cifra a 100,000</a></div>
            
          
        </div>
      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListL-items-item" data-click="liL2promoXSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage



>
                    <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/espanol/educacion"    >Educación</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/espanol/educacion/articulo/2020-05-23/la-uc-toma-la-decision-historica-de-suspender-los-requisitos-de-act-y-sat-para-la-admision"    >La UC toma la decisión histórica de suspender los requisitos de ACT y SAT para la admisión</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="La UC toma la decisión histórica de suspender los requisitos de ACT y SAT para la admisión" href="https://www.latimes.com/espanol/educacion/articulo/2020-05-23/la-uc-toma-la-decision-historica-de-suspender-los-requisitos-de-act-y-sat-para-la-admision"    >
    <img class="Image" alt="SAT College Exams To Undergo Major Changes" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/a662e6f/2147483647/strip/true/crop/880x575+71+0/resize/320x209!/quality/90/?url=https%3A%2F%2Fwww.trbimg.com%2Fimg-5c995203%2Fturbine%2Fla-1553551871-4n4zr6m9wm-snap-image" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/espanol/educacion"    >Educación</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/espanol/educacion/articulo/2020-05-23/la-uc-toma-la-decision-historica-de-suspender-los-requisitos-de-act-y-sat-para-la-admision"    >La UC toma la decisión histórica de suspender los requisitos de ACT y SAT para la admisión</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Los regentes de la UC votan para suspender los requisitos de los exámenes SAT y ACT para la admisión, marcando un punto de inflexión en el debate sobre los resultados de los exámenes estandarizados.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590186061211"></div>

      
        <div class="PromoXSmall-items">
          <div class="PromoXSmall-items-title">More Coverage</div>

          
            
                <div class="PromoXSmall-items-item"><a class="Link"  href="https://www.latimes.com/california/story/2020-05-21/california-school-districts-must-determine-how-and-when-to-reopen"    >Proposed budget cuts threaten safe opening of California schools, leaders say</a></div>
            
          
        </div>
      
    </div>
  </div>
</ps-promo>

                </li>
            
        </ul>
    
</div>

            </div>
        
    </div>
</div>

<div class="GoogleDfpAd-wrapper">
    <div class="GoogleDfpAd-adCaption">Advertisement</div>
    <div id="googleAdb91a3f15-6770-41af-ae0f-3d7922dd35a7" class="GoogleDfpAd" data-slot-name="/21787098806/web.latimes/homepage" data-slot-sizes="[[2, 2], [970, 250], [970, 90], [728, 90]]" data-ad-type="leaderboard" data-ptype="sectionfront" data-slot-adSizeMap="[[[1241, 0], [2, 2], [970, 250], [970, 90], [728, 90]], [[1024, 0], [728, 90], [2, 2]], [[0, 0], [320, 50], [2, 2], [320, 100]]]">
        <span class="GoogleDfpAd-placeholder"></span>
    </div>
</div>

    <div class="TwoColumnContainer7030">
    
    <div class="TwoColumnContainer7030-row">
        
            <div class="TwoColumnContainer7030-column" data-click="7030col1">
                
<div class="ListG"  data-list-id="0000016f-7c78-dcff-a97f-7c79d1b60001">
    <div class="ListG-header" >
    
        <div class="ListG-header-title"><a href="https://www.latimes.com/sports" >Sports<svg class="chevron"><use xlink:href="#chevron"></use></svg></a></div>
    
</div>


    
        <div class="ListG-items">
            
            <div class="ListG-items-column">
                
                    <div class="ListG-items-item" data-click="liG0promoMedium" data-show-img
 data-show-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                        <ps-promo class="PromoMedium"  data-content-type="article"
>
  <div class="PromoMedium-wrapper">
    <div class="PromoMedium-titleContainerDupe">
      

      
        
          <div class="PromoMedium-category">
            <a class="Link"  href="https://www.latimes.com/sports/chargers"    >Chargers</a>
          </div>
        
      

      
        <div class="PromoMedium-title">
          
    <a class="Link"  href="https://www.latimes.com/sports/story/2020-05-23/former-chargers-quarterback-ryan-leaf-arrested-in-palm-desert"    >Former Chargers quarterback Ryan Leaf arrested in Palm Desert</a>

        </div>
      
    </div>

    
      <div class="PromoMedium-media">
        
          
            <a class="Link" aria-label="Former Chargers quarterback Ryan Leaf arrested in Palm Desert" href="https://www.latimes.com/sports/story/2020-05-23/former-chargers-quarterback-ryan-leaf-arrested-in-palm-desert"    >
    <img class="Image" alt="Ryan Leaf" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/4a97ee2/2147483647/strip/true/crop/1728x1152+160+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F82%2F78%2F99fc83d007cfde499f472abcd160%2Fla-1556151590-p7naj54c4y-snap-image" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoMedium-content">
      <div class="PromoMedium-titleContainer">
        

        
          
            <div class="PromoMedium-category">
              <a class="Link"  href="https://www.latimes.com/sports/chargers"    >Chargers</a>
            </div>
          
        

        
          <div class="PromoMedium-title">
            
    <a class="Link"  href="https://www.latimes.com/sports/story/2020-05-23/former-chargers-quarterback-ryan-leaf-arrested-in-palm-desert"    >Former Chargers quarterback Ryan Leaf arrested in Palm Desert</a>

          </div>
        
      </div>

      
        <div class="PromoMedium-description">Leaf was arrested on a domestic battery charge, according to booking information provided by the Riverside County Sheriff’s Department.</div>
      

        
            
        

      <div class="PromoMedium-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590268646211"></div>

      
    </div>
  </div>
</ps-promo>

                    </div>
                
            </div>
            <div class="ListG-items-column">
                
                    
                
                    
                        
                            <div class="ListG-items-item" data-click="liG1promoSmall" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                                <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/sports"    >Sports</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/sports/story/2020-05-22/santa-anita-bugler-jay-cohen-union-musician-plaschke"    >Plaschke: He plays to empty seats, but L.A.&#x27;s only working live musician has song of hope</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Plaschke: He plays to empty seats, but L.A.&#x27;s only working live musician has song of hope" href="https://www.latimes.com/sports/story/2020-05-22/santa-anita-bugler-jay-cohen-union-musician-plaschke"    >
    <img class="Image" alt="544647_SP_0522_jay_cohen1_WJS.jpg" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/461dbff/2147483647/strip/true/crop/4218x2812+98+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F9a%2F8a%2Fb4f0356442ebbfb29625271a1b6a%2Fla-photos-1staff-544647-sp-0522-jay-cohen1-wjs.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/sports"    >Sports</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/sports/story/2020-05-22/santa-anita-bugler-jay-cohen-union-musician-plaschke"    >Plaschke: He plays to empty seats, but L.A.&#x27;s only working live musician has song of hope</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">These days, amid the coronavirus closure, Santa Anita Park racetrack bugler Jay Cohen belts out his call to the post for an audience of one.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590192591293"></div>

      
    </div>
  </div>
</ps-promo>

                            </div>
                        
                    
                
                    
                        
                            <div class="ListG-items-item" data-click="liG2promoSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                                <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/sports/hockey"    >Hockey</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/sports/hockey/story/2020-05-23/perfect-power-play-ali-downey-represents-ducks-nurses-with-class"    >Elliott: Quite a power play as Ali Downey represents Ducks and nurses with class</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Elliott: Quite a power play as Ali Downey represents Ducks and nurses with class" href="https://www.latimes.com/sports/hockey/story/2020-05-23/perfect-power-play-ali-downey-represents-ducks-nurses-with-class"    >
    <img class="Image" alt="542903_la-sp-ali-downey-ducks-ice-crew-nurse_8_AJS.jpg" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/069be9e/2147483647/strip/true/crop/4500x3000+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F3d%2F9c%2Fc4351c494bef824f077a3080861b%2Fla-photos-1staff-542903-la-sp-ali-downey-ducks-ice-crew-nurse-8-ajs.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/sports/hockey"    >Hockey</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/sports/hockey/story/2020-05-23/perfect-power-play-ali-downey-represents-ducks-nurses-with-class"    >Elliott: Quite a power play as Ali Downey represents Ducks and nurses with class</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Ali Downey, a critical care nurse in Fountain Valley, is part of the Ducks’ 16-woman group that works home games and represents the team at events.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590242447207"></div>

      
        <div class="PromoSmall-items">
          <div class="PromoSmall-items-title">More Coverage</div>

          
            
                <div class="PromoSmall-items-item"><a class="Link"  href="https://www.latimes.com/sports/hockey/story/2020-05-22/concept-of-nhl-proposal-to-resume-play-approved-by-nhlpa-coronavirus"    >Concept of NHL’s proposal to resume play is approved by players’ association</a></div>
            
          
            
                <div class="PromoSmall-items-item"><a class="Link"  href="https://www.latimes.com/sports/story/2020-05-22/mental-health-no-longer-dirty-words-in-macho-world-of-nhl"    >Elliott: Mental health no longer dirty words in macho world of NHL</a></div>
            
          
        </div>
      
    </div>
  </div>
</ps-promo>

                            </div>
                        
                    
                
                    
                        
                            <div class="ListG-items-item" data-click="liG3promoSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                                <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/sports/dodgers"    >Dodgers</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/sports/dodgers/story/2020-05-22/unusual-times-will-make-for-an-unusual-mlb-draft-for-dodgers-other-clubs"    >Unusual times will make for an unusual MLB draft for Dodgers, other clubs</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Unusual times will make for an unusual MLB draft for Dodgers, other clubs" href="https://www.latimes.com/sports/dodgers/story/2020-05-22/unusual-times-will-make-for-an-unusual-mlb-draft-for-dodgers-other-clubs"    >
    <img class="Image" alt="Dodgers Indians Spring Baseball" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/c34fc41/2147483647/strip/true/crop/3600x2400+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fc6%2Fc1%2Fbb2bbdcf46b2b51c16629c8f30f2%2Fdodgers-indians-spring-baseball-82369.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/sports/dodgers"    >Dodgers</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/sports/dodgers/story/2020-05-22/unusual-times-will-make-for-an-unusual-mlb-draft-for-dodgers-other-clubs"    >Unusual times will make for an unusual MLB draft for Dodgers, other clubs</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">The MLB draft will be just five rounds and held virtually. Undrafted players can’t sign for more than $20,000, meaning many likely won’t turn pro for now.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590199150010"></div>

      
    </div>
  </div>
</ps-promo>

                            </div>
                        
                    
                
            </div>
            
        </div>
    
</div>

<div class="ListE"  data-list-id="00000172-423d-d8f8-abf3-77bffd6a0001">
    <div class="ListE-header" >
    
        <div class="ListE-header-title">Weekend Reads</div>
    
</div>


    
        <ul class="ListE-items">
            
                <li class="ListE-items-item" data-click="liE0promoSmall" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/politics"    >Politics</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/politics/story/2020-05-22/what-are-the-trump-administration-options-for-china-and-hong-kong"    >Trump must now grapple with how to confront Beijing’s crackdown on Hong Kong</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Trump must now grapple with how to confront Beijing’s crackdown on Hong Kong" href="https://www.latimes.com/politics/story/2020-05-22/what-are-the-trump-administration-options-for-china-and-hong-kong"    >
    <img class="Image" alt="Hong Kong Protests China Congress" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/5a8407d/2147483647/strip/true/crop/4924x3283+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fac%2F38%2F0023286d48909dc3231400cf769d%2Fhong-kong-protests-china-congress-64275.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/politics"    >Politics</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/politics/story/2020-05-22/what-are-the-trump-administration-options-for-china-and-hong-kong"    >Trump must now grapple with how to confront Beijing’s crackdown on Hong Kong</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Beijing’s move to tighten its grip on Hong Kong drew swift condemnation from U.S. officials as they weighed options for new sanctions.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590196600001"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListE-items-item" data-click="liE1promoSmall" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/politics"    >Politics</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/politics/story/2020-05-21/coronavirus-test-kits-las-vegas-abu-dhabi"    >Las Vegas needed help testing for coronavirus. Then a crown prince stepped in</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Las Vegas needed help testing for coronavirus. Then a crown prince stepped in" href="https://www.latimes.com/politics/story/2020-05-21/coronavirus-test-kits-las-vegas-abu-dhabi"    >
    <img class="Image" alt="Crown Prince of Abu Dhabi left NV Virus Outbreak Nevada" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/c5a3248/2147483647/strip/true/crop/3000x2000+400+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F17%2Fa6%2F6cccf91a4056a851a4d8db0c5ae3%2Fla-na-crown-prince-vagas-strip.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/politics"    >Politics</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/politics/story/2020-05-21/coronavirus-test-kits-las-vegas-abu-dhabi"    >Las Vegas needed help testing for coronavirus. Then a crown prince stepped in</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">A donation of 200,000 coronavirus test kits from the ruler of the United Arab Emirates has put Las Vegas on a path to eventually reopen its economy.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 21, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590110291663"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListE-items-item" data-click="liE2promoSmall" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="longForm"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-17/latino-essential-workers-coronavirus"    >The price of being ‘essential’: Latino service workers bear brunt of coronavirus</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="The price of being ‘essential’: Latino service workers bear brunt of coronavirus" href="https://www.latimes.com/california/story/2020-05-17/latino-essential-workers-coronavirus"    >
    <img class="Image" alt="540566_ME_essential_workers_GXC_0126.JPG" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/b34cad1/2147483647/strip/true/crop/6594x4396+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fb0%2Fc6%2Ff850bf844c97a71d14cf3f5331ca%2Fla-photos-1staff-540566-me-essential-workers-gxc-0126.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-17/latino-essential-workers-coronavirus"    >The price of being ‘essential’: Latino service workers bear brunt of coronavirus</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Many essential workers&nbsp;—&nbsp;cashiers, truck drivers, meat packers —&nbsp;are Latino. They can’t stay home. And they’re being hit hard by the novel coronavirus. </div>
      

      <div class="PromoSmall-timestamp" data-date="May 17, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1589720444574"></div>

      
        <div class="PromoSmall-items">
          <div class="PromoSmall-items-title">More Coverage</div>

          
            
                <div class="PromoSmall-items-item"><a class="Link"  href="https://www.latimes.com/projects/california-coronavirus-cases-tracking-outbreak/"  target="_blank"    >Tracking coronavirus in California</a></div>
            
          
            
                <div class="PromoSmall-items-item"><a class="Link"  href="https://www.latimes.com/espanol/"  target="_blank"    >Noticias en español</a></div>
            
          
        </div>
      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListE-items-item" data-click="liE3promoSmall" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-22/little-sense-of-shared-grief-as-virus-deaths-near-100-000"    >Little sense of shared grief as virus deaths near 100,000</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Little sense of shared grief as virus deaths near 100,000" href="https://www.latimes.com/world-nation/story/2020-05-22/little-sense-of-shared-grief-as-virus-deaths-near-100-000"    >
    <img class="Image" alt="A funeral is held for coronavirus Covid 19 victim Wanda DeSelle, age 76 in Madera." width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/a7fd3e4/2147483647/strip/true/crop/6388x4259+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F39%2F31%2F8910cc754c6586e78cc2f8de13d3%2Fla-na-covid-deaths-surpass-vietnam-pictures14.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-22/little-sense-of-shared-grief-as-virus-deaths-near-100-000"    >Little sense of shared grief as virus deaths near 100,000</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Death is hitting the country unevenly, and Trump is counting on a polarized and fragmented response to prevent the toll from sinking his presidency.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590145222920"></div>

      
        <div class="PromoSmall-items">
          <div class="PromoSmall-items-title">More Coverage</div>

          
            
                <div class="PromoSmall-items-item"><a class="Link"  href="https://www.latimes.com/projects/california-coronavirus-cases-tracking-outbreak/reopening-across-counties/"  target="_blank"    >Tracking California’s reopening</a></div>
            
          
            
                <div class="PromoSmall-items-item"><a class="Link"  href="https://www.latimes.com/espanol/"  target="_blank"    >Noticias en español</a></div>
            
          
        </div>
      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListE-items-item" data-click="liE4promoSmall" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/science"    >Science</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/science/story/2020-05-22/whats-the-link-between-the-coronavirus-and-the-kawasaki-like-disease-mis-c"    >What’s the link between the coronavirus and the Kawasaki-like disease MIS-C?</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="What’s the link between the coronavirus and the Kawasaki-like disease MIS-C?" href="https://www.latimes.com/science/story/2020-05-22/whats-the-link-between-the-coronavirus-and-the-kawasaki-like-disease-mis-c"    >
    <img class="Image" alt="Coronavirus" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/f0edc34/2147483647/strip/true/crop/2100x1400+0+193/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fc3%2Fe6%2F90d5817a4bdbbc72bef1523c9137%2F49666286236-30d05cefb2-o.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/science"    >Science</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/science/story/2020-05-22/whats-the-link-between-the-coronavirus-and-the-kawasaki-like-disease-mis-c"    >What’s the link between the coronavirus and the Kawasaki-like disease MIS-C?</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">The coronavirus can trigger a rare but serious inflammatory response that health officials are calling multi-system inflammatory syndrome in children, or MIS-C.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590178800610"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListE-items-item" data-click="liE5promoSmall" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/sports"    >Sports</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/sports/story/2020-05-22/la-firefighter-fights-against-time-in-battle-with-als"    >Former Rams player turned firefighter fights for hope amid ALS</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Former Rams player turned firefighter fights for hope amid ALS" href="https://www.latimes.com/sports/story/2020-05-22/la-firefighter-fights-against-time-in-battle-with-als"    >
    <img class="Image" alt="533244_SP_stevens_2_RCG.JPG" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/faf4327/2147483647/strip/true/crop/3000x2000+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fc8%2Fb3%2F6e76f2164bfa85680b387d3e8292%2Fla-photos-1staff-533244-sp-stevens-2-rcg.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/sports"    >Sports</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/sports/story/2020-05-22/la-firefighter-fights-against-time-in-battle-with-als"    >Former Rams player turned firefighter fights for hope amid ALS</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Eric Stevens was relentless as a Cal football player. He battles ALS with the same approach.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590156009958"></div>

      
        <div class="PromoSmall-items">
          <div class="PromoSmall-items-title">More Coverage</div>

          
            
                <div class="PromoSmall-items-item"><a class="Link"  href="https://www.latimes.com/sports/story/2020-05-23/former-chargers-quarterback-ryan-leaf-arrested-in-palm-desert"    >Former Chargers quarterback Ryan Leaf arrested in Palm Desert</a></div>
            
          
            
                <div class="PromoSmall-items-item"><a class="Link"  href="https://www.latimes.com/sports/chargers/story/2020-05-22/ex-chargers-linebacker-donnie-edwards-works-to-recognize-veterans"    >Ex-Chargers linebacker Donnie Edwards works to recognize veterans</a></div>
            
          
        </div>
      
    </div>
  </div>
</ps-promo>

                </li>
            
        </ul>
    
</div>

<div class="ListE"  data-list-id="0000016f-f6c8-de8e-a1ef-fefe3db60001">
    <div class="ListE-header" >
    
        <div class="ListE-header-title"><a href="https://www.latimes.com/food" >Food<svg class="chevron"><use xlink:href="#chevron"></use></svg></a></div>
    
</div>


    
        <ul class="ListE-items">
            
                <li class="ListE-items-item" data-click="liE0promoSmall" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/food"    >Food</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/food/story/2020-05-22/banana-pudding-is-the-only-dessert-your-summer-needs"    >Banana pudding is the only dessert your summer needs</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Banana pudding is the only dessert your summer needs" href="https://www.latimes.com/food/story/2020-05-22/banana-pudding-is-the-only-dessert-your-summer-needs"    >
    <img class="Image" alt="la-fo-how-to-boil-water-banana-pudding.gif" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/881de8a/2147483647/strip/true/crop/600x400+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F92%2Ffa%2F4f5b637b4f339ce5f6c4ca95b008%2Fla-fo-how-to-boil-water-banana-pudding.gif" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/food"    >Food</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/food/story/2020-05-22/banana-pudding-is-the-only-dessert-your-summer-needs"    >Banana pudding is the only dessert your summer needs</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Ripe bananas, cooling vanilla pudding and crunchy cookies, homemade or not, makes for the best summer dessert for backyard barbecues and picnics.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590181230441"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListE-items-item" data-click="liE1promoSmall" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-show-more-coverage
 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/food"    >Food</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/food/story/2020-05-23/your-weekend-quarantine-cooking-project-citrus-marmalade"    >Need a fun weekend quarantine project? Try this citrus marmalade recipe</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Need a fun weekend quarantine project? Try this citrus marmalade recipe" href="https://www.latimes.com/food/story/2020-05-23/your-weekend-quarantine-cooking-project-citrus-marmalade"    >
    <img class="Image" alt="la-fo-marmalade.jpg" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/580ec78/2147483647/strip/true/crop/3000x2000+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fc2%2Fcc%2F4d9e903343ab872cfb621c4ceb9c%2Fla-fo-marmalade.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/food"    >Food</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/food/story/2020-05-23/your-weekend-quarantine-cooking-project-citrus-marmalade"    >Need a fun weekend quarantine project? Try this citrus marmalade recipe</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">This easy citrus marmalade recipe preserves the best of Southern California oranges and clementines. It’s a great coronavirus stay-at-home project.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590242438773"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListE-items-item" data-click="liE2promoSmall" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/food"    >Food</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/food/story/2020-05-21/whip-up-homemade-mayo-for-the-best-sandwiches-and-salads"    >Whip up homemade mayo for the best sandwiches and salads</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Whip up homemade mayo for the best sandwiches and salads" href="https://www.latimes.com/food/story/2020-05-21/whip-up-homemade-mayo-for-the-best-sandwiches-and-salads"    >
    <img class="Image" alt="la-fo-how-to-boil-water-mayonnaise.gif" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/c411c40/2147483647/strip/true/crop/1200x800+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F0e%2F2c%2Fbac05d844644b4d6e4c0fbc55d7c%2Fla-fo-how-to-boil-water-mayonnaise.gif" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/food"    >Food</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/food/story/2020-05-21/whip-up-homemade-mayo-for-the-best-sandwiches-and-salads"    >Whip up homemade mayo for the best sandwiches and salads</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">This homemade whole-egg mayonnaise recipe uses only four ingredients and takes minutes to come together. It will make everything from potato salad to BLTs way more delicious.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 21, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590094803731"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
        </ul>
    
</div>

<div class="ListE"  data-list-id="0000016f-d009-da47-a9ef-d34922cb0001">
    <div class="ListE-header" >
    
        <div class="ListE-header-title">Staying Home</div>
    
</div>


    
        <ul class="ListE-items">
            
                <li class="ListE-items-item" data-click="liE0promoSmall" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp

 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/business"    >Business</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/business/story/2020-05-23/12-ways-to-make-money-renting-out-your-stuff"    >12 ways to make money renting out your stuff</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="12 ways to make money renting out your stuff" href="https://www.latimes.com/business/story/2020-05-23/12-ways-to-make-money-renting-out-your-stuff"    >
    <img class="Image" alt="Attic office" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/fdb8d39/2147483647/strip/true/crop/260x173+0+88/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F36%2Fa7%2F3f9d31a316e3fa0487ff7e9bd01b%2Fla-hm-space28apr28-iekytvkf" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/business"    >Business</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/business/story/2020-05-23/12-ways-to-make-money-renting-out-your-stuff"    >12 ways to make money renting out your stuff</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">With unemployment in the stratosphere, it may be comforting to know that you can make money without a job. </div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590238812337"></div>

      
        <div class="PromoSmall-items">
          <div class="PromoSmall-items-title">More Coverage</div>

          
            
                <div class="PromoSmall-items-item"><a class="Link"  href="https://www.latimes.com/business/story/2020-05-23/turo-review-side-hustl"    >Review: Turo can be a money-maker — but don’t skimp on the insurance</a></div>
            
          
        </div>
      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListE-items-item" data-click="liE1promoSmall" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/entertainment-arts/books"    >Books</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/books/story/2020-05-22/around-the-world-in-8-novels-for-memorial-day"    >Around the world in 8 novels for Memorial Day</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Around the world in 8 novels for Memorial Day" href="https://www.latimes.com/entertainment-arts/books/story/2020-05-22/around-the-world-in-8-novels-for-memorial-day"    >
    <img class="Image" alt="la_CA_the_mountains_sing_book_12.JPG" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/d6d2442/2147483647/strip/true/crop/1842x1228+0+774/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F56%2F56%2Fb56d8c724a86ba10bef472aef92e%2Fla-ca-the-mountains-sing-book-12.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/entertainment-arts/books"    >Books</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/books/story/2020-05-22/around-the-world-in-8-novels-for-memorial-day"    >Around the world in 8 novels for Memorial Day</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Even in normal times, fiction can be the best way to know the world. From Leningrad to Vietnam, Ondaatje to Adichie, choose your homebound adventure.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590152443370"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListE-items-item" data-click="liE2promoSmall"
 data-hide-description
 data-hide-category
 data-hide-timestamp

 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/business"    >Business</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/business/story/2020-05-21/home-repair-during-coronavirus"    >Should you fix that yourself? How to handle home repair during the pandemic</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Should you fix that yourself? How to handle home repair during the pandemic" href="https://www.latimes.com/business/story/2020-05-21/home-repair-during-coronavirus"    >
    <img class="Image" alt="463493_ME_PEBBLE-BEACH-CONCOURS-DELEGANCE_KKN_41793.JPG" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/4d542a4/2147483647/strip/true/crop/5760x3840+0+1/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F3d%2Fa4%2Fd073d0e249aea456bdb255e2e223%2Fla-photos-1staff-463493-me-pebble-beach-concours-delegance-kkn-41793.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/business"    >Business</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/business/story/2020-05-21/home-repair-during-coronavirus"    >Should you fix that yourself? How to handle home repair during the pandemic</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Will bringing in a handyman put your safety at risk? Industry experts weigh in on how to handle home repair during coronavirus stay-at-home orders.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 21, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590081245235"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListE-items-item" data-click="liE3promoSmall"
 data-hide-description
 data-hide-category
 data-hide-timestamp

 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/travel"    >Travel</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/travel/story/2020-05-21/bad-driving-shutdown-help-rusty"    >Are you uneasy behind the wheel? Many drivers are. Here’s why and what you can do</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Are you uneasy behind the wheel? Many drivers are. Here’s why and what you can do" href="https://www.latimes.com/travel/story/2020-05-21/bad-driving-shutdown-help-rusty"    >
    <img class="Image" alt="la-tr-travel-spot-web-lead.jpg" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/510cb64/2147483647/strip/true/crop/1800x1200+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F5d%2F62%2Fbe3c016149a683d53901bae1f7f2%2Fla-tr-travel-spot-web-lead.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/travel"    >Travel</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/travel/story/2020-05-21/bad-driving-shutdown-help-rusty"    >Are you uneasy behind the wheel? Many drivers are. Here’s why and what you can do</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">If you haven’t driven much lately, your return behind the wheel may feel awkward. That’s not unusual. Here’s what to do to make yourself comfortable again.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 21, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590073245670"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListE-items-item" data-click="liE4promoSmall" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/lifestyle"    >Lifestyle</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/lifestyle/story/2020-05-20/coronavirus-secrets-3-enjoying-quarantine-time"    >Coronavirus secrets: ‘I’m already lazy so this is right up my alley’</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Coronavirus secrets: ‘I’m already lazy so this is right up my alley’" href="https://www.latimes.com/lifestyle/story/2020-05-20/coronavirus-secrets-3-enjoying-quarantine-time"    >
    <img class="Image" alt="la-ig-coronavirus-confessions-part-3.jpg" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/f6cf3d7/2147483647/strip/true/crop/2160x1440+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F1d%2F15%2F3dab102140e290bdb07d56527e1a%2Fla-ig-coronavirus-confessions-part-3.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/lifestyle"    >Lifestyle</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/lifestyle/story/2020-05-20/coronavirus-secrets-3-enjoying-quarantine-time"    >Coronavirus secrets: ‘I’m already lazy so this is right up my alley’</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Driving from L.A. to San Diego to do laundry, secret trips to the beach and other anonymous admissions from readers.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 20, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1589995994900"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListE-items-item" data-click="liE5promoSmall" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-top-center


>
                    <ps-promo class="PromoSmall"  data-content-type="storyGallery"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/entertainment-arts"    >Entertainment &amp; Arts</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/story/2020-05-18/apocalypse-coronavirus-outbreak-movies-tv-books"    >Pondering the end of the world? An apocalyptic entertainment guide, if you can’t help it</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Pondering the end of the world? An apocalyptic entertainment guide, if you can’t help it" href="https://www.latimes.com/entertainment-arts/story/2020-05-18/apocalypse-coronavirus-outbreak-movies-tv-books"    >
    <img class="Image" alt="“Contagion”" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/931a56f/2147483647/strip/true/crop/2045x1363+2+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F44%2Fce%2F06566b66f203693b971ce323e8a3%2Fla-oe-goldberg-ebola-crisis-management-2014101-001" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/entertainment-arts"    >Entertainment &amp; Arts</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/story/2020-05-18/apocalypse-coronavirus-outbreak-movies-tv-books"    >Pondering the end of the world? An apocalyptic entertainment guide, if you can’t help it</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">We know. We know. You want to look away, but you can’t. </div>
      

      <div class="PromoSmall-timestamp" data-date="May 18, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1589823996308"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
        </ul>
    
</div>

    <div class="OneColumnContainer" data-click="1col">
    
        <div class="OneColumnContainer-title">EVENTS AND OFFERS</div>
    
    <div class="OneColumnContainer-row">
        
            <div class="OneColumnContainer-column">
                
<div class="ListW"  data-list-id="0000016e-2408-d7d6-a1ff-7d49db950001">
    
        <div class="ListW-items">
            
                
                    <div class="ListW-items-item" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp




>
                        <ps-promo class="PromoSmall"  data-content-type="external"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/about/virtual-events?utm_source=LATIMES&amp;utm_medium=homepagebarker&amp;utm_campaign=virtual_events"    >Bringing L.A. Times to you</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Bringing L.A. Times to you" href="https://www.latimes.com/about/virtual-events?utm_source=LATIMES&amp;utm_medium=homepagebarker&amp;utm_campaign=virtual_events"    >
    <img class="Image" alt="EventStream.jpg" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/9360082/2147483647/strip/true/crop/840x560+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fc1%2Fdd%2F05a1b5f94df38adca251706a15f7%2Feventstream.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/about/virtual-events?utm_source=LATIMES&amp;utm_medium=homepagebarker&amp;utm_campaign=virtual_events"    >Bringing L.A. Times to you</a>

          </div>
        
      </div>

      

      <div class="PromoSmall-timestamp" data-date="" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp=""></div>

      
    </div>
  </div>
</ps-promo>

                    </div>
                
            
                
                    <div class="ListW-items-item" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp




>
                        <ps-promo class="PromoSmall"  data-content-type="external"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/games/daily-crossword?utm_source=LATIMES&amp;utm_medium=homepagebarker&amp;utm_campaign=games"    >Play for FREE today</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Play for FREE today" href="https://www.latimes.com/games/daily-crossword?utm_source=LATIMES&amp;utm_medium=homepagebarker&amp;utm_campaign=games"    >
    <img class="Image" alt="LA Times Games V2" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/c0fa24e/2147483647/strip/true/crop/1680x1120+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F24%2F6e%2Fe2a6e2d3417ab019efe2a686a2c6%2Fgames-v2.jpeg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/games/daily-crossword?utm_source=LATIMES&amp;utm_medium=homepagebarker&amp;utm_campaign=games"    >Play for FREE today</a>

          </div>
        
      </div>

      

      <div class="PromoSmall-timestamp" data-date="" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp=""></div>

      
    </div>
  </div>
</ps-promo>

                    </div>
                
            
                
                    <div class="ListW-items-item" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp




>
                        <ps-promo class="PromoSmall"  data-content-type="external"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimeswine.com/la?utm_source=LATimes&amp;utm_campaign=Digital-Tile-840x560-Mar&amp;utm_content=StayHome-Set-29.95"    >6 award-winning wines for just $29.95 &amp; FREE SHIPPING</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="6 award-winning wines for just $29.95 &amp; FREE SHIPPING" href="https://www.latimeswine.com/la?utm_source=LATimes&amp;utm_campaign=Digital-Tile-840x560-Mar&amp;utm_content=StayHome-Set-29.95"    >
    <img class="Image" alt="Wine Club V3.jpg" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/8125c39/2147483647/strip/true/crop/840x560+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F12%2Fea%2Fcd0038844f90ad656d3401de9391%2Fwine-club-v3.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimeswine.com/la?utm_source=LATimes&amp;utm_campaign=Digital-Tile-840x560-Mar&amp;utm_content=StayHome-Set-29.95"    >6 award-winning wines for just $29.95 &amp; FREE SHIPPING</a>

          </div>
        
      </div>

      

      <div class="PromoSmall-timestamp" data-date="" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp=""></div>

      
    </div>
  </div>
</ps-promo>

                    </div>
                
            
                
                    <div class="ListW-items-item" data-show-img
 data-hide-description
 data-hide-category
 data-hide-timestamp




>
                        <ps-promo class="PromoSmall"  data-content-type="external"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://link.chtbl.com/AsianEnough?sid=HomepageBarker"    >New episodes with celebrity guests weekly. Listen Now.</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="New episodes with celebrity guests weekly. Listen Now." href="https://link.chtbl.com/AsianEnough?sid=HomepageBarker"    >
    <img class="Image" alt="LA Times Asian Enough" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/e2537e4/2147483647/strip/true/crop/1680x1120+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Ff0%2F67%2Fc4a130f74be7832d9aa619c7f749%2Fasian-enough.jpeg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://link.chtbl.com/AsianEnough?sid=HomepageBarker"    >New episodes with celebrity guests weekly. Listen Now.</a>

          </div>
        
      </div>

      

      <div class="PromoSmall-timestamp" data-date="" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp=""></div>

      
    </div>
  </div>
</ps-promo>

                    </div>
                
            
                
            
        </div>
    
</div>

            </div>
        
    </div>
</div>



            </div>
        
        
            <div class="TwoColumnContainer7030-column" data-click="7030col2">
                <ps-newsletter-module class="NewsletterModule" data-id="1245">
    <div class="NewsletterModule-container">
        <div class="NewsletterModule-icon">
            <svg><use xlink:href="#icon-flying-envelope"></use></svg><span class="sr-only">Newsletter</span>
        </div>
        
            <div class="NewsletterModule-title">Toward a more sustainable California</div>
        
        
            <a class="NewsletterModule-link" href="https://membership.latimes.com/newsletters"></a>
        
    </div>
    
        <p class="NewsletterModule-description">Get Boiling Point, our new newsletter exploring climate change, energy and the environment, and become part of the conversation — and the solution.</p>
    
    <form
        class="NewsletterModule-form"
        role="form"
        method="post"
        action="https://membership.latimes.com/subscription-services/v1/newsletters/subscriptions"
        data-error-message="Something went wrong. Please ensure your email address is valid and try again."
        blank-error-message="This field is required and cannot be empty."
        field-error-message="Something went wrong. Please ensure your email address is valid and try again."
        data-success-message="Thank you for signing up."
        data-success-link-message="Check out our other newsletters"
    >
        <div class="NewsletterModule-form-error"></div>
        
            <div class="EmailInput"><label class="EmailInput-label"><span></span>
        <input class="EmailInput-input" type="email" name="emailinput"
             placeholder="Enter Email Address" >
    </label>
</div>

        
        <div class="NewsletterModule-form-buttons">
            <button class="Button" type="submit">Sign Me Up
</button>

        </div>
    </form>
    
      <div class="NewsletterModule-disclaimer">
        You may occasionally receive promotional content from the Los Angeles Times.
      </div>
    
    <div class="NewsletterModule-errorMessage"></div>
</ps-newsletter-module>
<div class="ListZ"  data-list-id="0000016f-c87d-d883-a16f-d8ffaf170004">
    <div class="ListZ-header" >
    
        <div class="ListZ-header-title"><a href="https://membership.latimes.com/newsletters/" target="_blank">Newsletters<svg class="chevron"><use xlink:href="#chevron"></use></svg></a></div>
    
</div>


    
        <ul class="ListZ-items">
            
                <li class="ListZ-items-item" data-click="liL0promoXSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-right-center


>
                    <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/entertainment-arts"    >Entertainment &amp; Arts</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/newsletter/2020-05-23/coronavirus-reopening-25-theater-creative-minds-imagine-post-pandemic-theater-essential-arts"    >Essential Arts: What will theater be like post-COVID? 25 theater minds have answers</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Essential Arts: What will theater be like post-COVID? 25 theater minds have answers" href="https://www.latimes.com/entertainment-arts/newsletter/2020-05-23/coronavirus-reopening-25-theater-creative-minds-imagine-post-pandemic-theater-essential-arts"    >
    <img class="Image" alt="LOS ANGELES, CA-JANUARY 22, 2018: Quiara Alegria Hudes is photographed at the Mark Taper Forum in Lo" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/0c1394f/2147483647/strip/true/crop/2048x1338+0+40/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Ff8%2F88%2F5bf0e023219aca64ee2335296ec8%2Fla-1517185418-okpl4cqz7g-snap-image" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/entertainment-arts"    >Entertainment &amp; Arts</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/newsletter/2020-05-23/coronavirus-reopening-25-theater-creative-minds-imagine-post-pandemic-theater-essential-arts"    >Essential Arts: What will theater be like post-COVID? 25 theater minds have answers</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Theater’s most imaginative minds reimagine the stage post-COVID-19, an art show held all over L.A. and a hit Zoom play in Essential Arts newsletter.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590246044223"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListZ-items-item" data-click="liL1promoXSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-right-center


>
                    <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/newsletter/2020-05-23/essential-california-week-in-review-fast-reopening-looser-rules-essential-california-week-in-review"    >Essential California Week in Review: Fast and loose</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Essential California Week in Review: Fast and loose" href="https://www.latimes.com/california/newsletter/2020-05-23/essential-california-week-in-review-fast-reopening-looser-rules-essential-california-week-in-review"    >
    <img class="Image" alt="544519_LA-ME-VENTURA-COUNTY-REOPENING_17_ALS.jpg" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/146a6f4/2147483647/strip/true/crop/3600x2351+0+24/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fa3%2F35%2F260efd2c40e884f93f362fbc9e3e%2Fla-photos-1staff-544519-la-me-ventura-county-reopening-17-als.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/newsletter/2020-05-23/essential-california-week-in-review-fast-reopening-looser-rules-essential-california-week-in-review"    >Essential California Week in Review: Fast and loose</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Here’s a look at the top stories of the last week. It was a watershed week with loosened reopening rules and big approvals, but problems loom.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590243170115"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListZ-items-item" data-click="liL2promoXSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-right-center


>
                    <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/entertainment-arts/books"    >Books</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/books/newsletter/2020-05-23/book-club-newsletter-compton-cowboys-book-club"    >Book Club: Join our ‘Compton Cowboys’ June meetup</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Book Club: Join our ‘Compton Cowboys’ June meetup" href="https://www.latimes.com/entertainment-arts/books/newsletter/2020-05-23/book-club-newsletter-compton-cowboys-book-club"    >
    <img class="Image" alt="compton" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/43d71cd/2147483647/strip/true/crop/2906x1898+0+152/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fab%2F66%2F4d88a47848a89df39f46168ec3b4%2Fcompton-copy.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/entertainment-arts/books"    >Books</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/books/newsletter/2020-05-23/book-club-newsletter-compton-cowboys-book-club"    >Book Club: Join our ‘Compton Cowboys’ June meetup</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Walter Thompson-Hernández, author of “The Compton Cowboys,” joins the L.A. Times Book Club for a June 24 virtual meetup. </div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590242447123"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
        </ul>
    
</div>
<div class="GoogleDfpAd-wrapper">
    <div class="GoogleDfpAd-adCaption">Advertisement</div>
    <div id="googleAd8a8dfdd6-fdab-4c97-b0a9-75b8c0e9b36a" class="GoogleDfpAd" data-slot-name="/21787098806/web.latimes/homepage" data-slot-sizes="[[300, 250], [300, 600]]" data-ad-type="mrec" data-ptype="sectionfront" data-slot-adSizeMap="[[[800, 0], [300, 600], [300, 250]], [[1024, 0], [300, 600], [300, 250]], [[0, 0], [300, 250]]]">
        <span class="GoogleDfpAd-placeholder"></span>
    </div>
</div>

<div class="ListZ"  data-list-id="0000016c-1112-dd26-a17e-99ff5afc0000">
    <div class="ListZ-header" >
    
        <div class="ListZ-header-title">Join the conversation</div>
    
</div>


    
        <ul class="ListZ-items">
            
                <li class="ListZ-items-item" data-click="liL0promoXSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-right-center


>
                    <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/a-big-gamble-across-southern-california-casinos-reopen-as-stay-at-home-restrictions-ease"    >As coronavirus stay-at-home restrictions ease, California casinos gamble on reopening</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="As coronavirus stay-at-home restrictions ease, California casinos gamble on reopening" href="https://www.latimes.com/california/story/2020-05-23/a-big-gamble-across-southern-california-casinos-reopen-as-stay-at-home-restrictions-ease"    >
    <img class="Image" alt="544260_ME_0522_casinos_reopen_2_GMF.jpg" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/b626ad8/2147483647/strip/true/crop/4200x2743+0+6/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F33%2F28%2Fe2c0b2204e6fa004da565e999082%2Fla-photos-1staff-544260-me-0522-casinos-reopen-2-gmf.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/a-big-gamble-across-southern-california-casinos-reopen-as-stay-at-home-restrictions-ease"    >As coronavirus stay-at-home restrictions ease, California casinos gamble on reopening</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">On Friday, casinos across Southern California opened their doors to gamblers as some lockdown restrictions are softened. </div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590238821233"></div>

      
        <div class="PromoXSmall-items">
          <div class="PromoXSmall-items-title">More Coverage</div>

          
            
                <div class="PromoXSmall-items-item"><a class="Link"  href="https://www.latimes.com/business/story/2020-05-23/card-clubs-coronavirus-reopening-plan"    >Card clubs offer reopening plan as tribal and Vegas casinos get back in the game</a></div>
            
          
            
                <div class="PromoXSmall-items-item"><a class="Link"  href="https://www.latimes.com/projects/california-coronavirus-cases-tracking-outbreak/reopening-across-counties/"  target="_blank"    >Which California counties are reopening?</a></div>
            
          
        </div>
      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListZ-items-item" data-click="liL1promoXSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-right-center


>
                    <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/orange-county-cleared-to-reopen-more-businesses"    >Orange County cleared to reopen more businesses amid coronavirus restrictions</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Orange County cleared to reopen more businesses amid coronavirus restrictions" href="https://www.latimes.com/california/story/2020-05-23/orange-county-cleared-to-reopen-more-businesses"    >
    <img class="Image" alt="534559_beach_activity_huntington017_LS.jpg" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/0a100d6/2147483647/strip/true/crop/4800x3135+0+45/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F52%2Fd9%2Fead7881e4eff974248c2e0a3a0de%2Fla-photos-1staff-534559-beach-activity-huntington017-ls.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/orange-county-cleared-to-reopen-more-businesses"    >Orange County cleared to reopen more businesses amid coronavirus restrictions</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Orange County has been approved by the state to mount a more aggressive reopening of local businesses amid the coronavirus, officials said Saturday. </div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590269374675"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            
                <li class="ListZ-items-item" data-click="liL2promoXSmall" data-hide-img
 data-hide-description
 data-hide-category
 data-hide-timestamp
 data-hide-more-coverage
 data-right-center


>
                    <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/la-county-coronavirus-hot-spot-los-angeles"    >How L.A. County became coronavirus epicenter: Slower shutdown, density, poverty among theories</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="How L.A. County became coronavirus epicenter: Slower shutdown, density, poverty among theories" href="https://www.latimes.com/california/story/2020-05-23/la-county-coronavirus-hot-spot-los-angeles"    >
    <img class="Image" alt="515540_ME_0406_NEIGHBORHOOD_MWY_1630.JPG" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/0c7bccd/2147483647/strip/true/crop/6240x4076+0+42/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F58%2F11%2Ffb5b7e0f4bfdba86dec5c681c187%2Fla-photos-1staff-515540-me-0406-neighborhood-mwy-1630.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/la-county-coronavirus-hot-spot-los-angeles"    >How L.A. County became coronavirus epicenter: Slower shutdown, density, poverty among theories</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Theories abound as to why L.A. County has the bulk of the state’s confirmed coronavirus cases, but a clear explanation has been elusive. </div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590258945847"></div>

      
        <div class="PromoXSmall-items">
          <div class="PromoXSmall-items-title">More Coverage</div>

          
            
                <div class="PromoXSmall-items-item"><a class="Link"  href="https://www.latimes.com/projects/california-coronavirus-cases-tracking-outbreak/"  target="_blank"    >Tracking coronavirus in California</a></div>
            
          
            
                <div class="PromoXSmall-items-item"><a class="Link"  href="https://www.latimes.com/espanol/"  target="_blank"    >En español</a></div>
            
          
        </div>
      
    </div>
  </div>
</ps-promo>

                </li>
            
        </ul>
    
</div>
<div class="GoogleDfpAd-wrapper">
    <div class="GoogleDfpAd-adCaption">Advertisement</div>
    <div id="googleAd216dc516-dc48-4cf4-97e9-50532c7fbf12" class="GoogleDfpAd" data-slot-name="/21787098806/web.latimes/homepage" data-slot-sizes="[[300, 250], [300, 600]]" data-ad-type="mrec" data-ptype="sectionfront" data-slot-adSizeMap="[[[800, 0], [300, 600], [300, 250]], [[1024, 0], [300, 600], [300, 250]], [[0, 0], [300, 250]]]">
        <span class="GoogleDfpAd-placeholder"></span>
    </div>
</div>

            </div>
        
    </div>
</div>


    <div class="FourColumnContainer">
    
    <div class="FourColumnContainer-row">
        
            <div class="FourColumnContainer-column" data-click="4col1">
                
<div class="ListH"  data-list-id="0000016a-0df7-dffa-a76b-3dff3d6c0001">
    <div class="ListH-header" >
    
        <div class="ListH-header-title"><a href="https://www.latimes.com/world-nation" >World &amp; Nation<svg class="chevron"><use xlink:href="#chevron"></use></svg></a></div>
    
</div>


    
        <ul class="ListH-items">
            
                <li class="ListH-items-item" data-click="liH0promoSmall"
 data-hide-description
 data-hide-category
 data-hide-timestamp

 data-top-center


>
                <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-23/pandemic-halts-vaccination-for-nearly-80-million-children"    >Coronavirus crisis halts vaccinations against other diseases for nearly 80 million children</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Coronavirus crisis halts vaccinations against other diseases for nearly 80 million children" href="https://www.latimes.com/world-nation/story/2020-05-23/pandemic-halts-vaccination-for-nearly-80-million-children"    >
    <img class="Image" alt="Virus Outbreak Vaccinations Interrupted" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/716c089/2147483647/strip/true/crop/4497x2998+0+10/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F07%2F60%2F1a0e1990915ad61c75096f23108f%2Ffaabd135aa9a436a827929b3d9ba7cf6" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-23/pandemic-halts-vaccination-for-nearly-80-million-children"    >Coronavirus crisis halts vaccinations against other diseases for nearly 80 million children</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">The coronavirus outbreak is interrupting immunization against diseases including measles, polio and cholera, a report says.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590261523821"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            

            
                
            
                
                    <li class="ListH-items-item" data-click="liH1promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-23/coronavirus-spread-water-scarce-hand-washing"    >Coronavirus spread is feared where water is scarce and hand washing is a luxury</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Coronavirus spread is feared where water is scarce and hand washing is a luxury" href="https://www.latimes.com/world-nation/story/2020-05-23/coronavirus-spread-water-scarce-hand-washing"    >
    <img class="Image" alt="Virus Outbreak Scarce Water" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/1ea3d1e/2147483647/strip/true/crop/5760x3762+0+39/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fc2%2F63%2F2ef40f1a6ed734626dd23d31d318%2F947cd7f17ac04a36a2408d7f462425f0" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-23/coronavirus-spread-water-scarce-hand-washing"    >Coronavirus spread is feared where water is scarce and hand washing is a luxury</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">For people around the world who are affected by war and poverty, the simple act of washing their hands is a luxury.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590260649176"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
                
                    <li class="ListH-items-item" data-click="liH2promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-21/sikh-kitchens-feed-new-delhis-masses-in-virus-lockdown"    >Sikh kitchens feed New Delhi’s masses during coronavirus lockdown </a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Sikh kitchens feed New Delhi’s masses during coronavirus lockdown " href="https://www.latimes.com/world-nation/story/2020-05-21/sikh-kitchens-feed-new-delhis-masses-in-virus-lockdown"    >
    <img class="Image" alt="Virus Outbreak One Good Thing Sikh Kitchens" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/543478a/2147483647/strip/true/crop/6654x4346+0+33/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F5f%2F87%2F5288e97f9749d0b7508596b3bb61%2F439a6376aadd435a9ea105463819219d" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-21/sikh-kitchens-feed-new-delhis-masses-in-virus-lockdown"    >Sikh kitchens feed New Delhi’s masses during coronavirus lockdown </a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">A Sikh temple in India’s capital city continues its centuries-old mission of providing free meals to the needy during the coronavirus lockdown.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590256515943"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
                
                    <li class="ListH-items-item" data-click="liH3promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-23/coronavirus-reopening-poll-return-gym-dining-out-restaurants"    >Many in U.S. won’t return to gym or dining out, new poll shows</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Many in U.S. won’t return to gym or dining out, new poll shows" href="https://www.latimes.com/world-nation/story/2020-05-23/coronavirus-reopening-poll-return-gym-dining-out-restaurants"    >
    <img class="Image" alt="la-na-coronavirus-georgia03.jpg" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/56231fe/2147483647/strip/true/crop/3640x2377+0+323/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fe3%2F4b%2Fcdd37c4e4d62b2e55d671d6f7bdc%2Fla-photos-1staff-la-na-coronavirus-georgia03.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-23/coronavirus-reopening-poll-return-gym-dining-out-restaurants"    >Many in U.S. won’t return to gym or dining out, new poll shows</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Much of the country remains unlikely to venture out to bars, restaurants, theaters or gyms anytime soon, a new survey shows.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590253225600"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
        </ul>
    
</div>

            </div>
        
        
            <div class="FourColumnContainer-column" data-click="4col2">
                
<div class="ListH"  data-list-id="0000016b-761a-de3b-abeb-f77f62350001">
    <div class="ListH-header" >
    
        <div class="ListH-header-title"><a href="https://www.latimes.com/lifestyle" >Lifestyle<svg class="chevron"><use xlink:href="#chevron"></use></svg></a></div>
    
</div>


    
        <ul class="ListH-items">
            
                <li class="ListH-items-item" data-click="liH0promoSmall"
 data-hide-description
 data-hide-category
 data-hide-timestamp

 data-top-center


>
                <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/lifestyle"    >Lifestyle</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/lifestyle/story/2020-05-22/print-and-play-puzzles-for-the-quarantine-weary"    >Print &amp; Play: 3 puzzles for the quarantine-weary</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Print &amp; Play: 3 puzzles for the quarantine-weary" href="https://www.latimes.com/lifestyle/story/2020-05-22/print-and-play-puzzles-for-the-quarantine-weary"    >
    <img class="Image" alt="la-hm-quarantine-fatigue-puzzles-web-lead.jpg" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/ff9c69e/2147483647/strip/true/crop/1800x1200+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fd8%2F50%2Fedde28e24af5afc4bacd4cdf6f9b%2Fla-hm-quarantine-fatigue-puzzles-web-lead.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/lifestyle"    >Lifestyle</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/lifestyle/story/2020-05-22/print-and-play-puzzles-for-the-quarantine-weary"    >Print &amp; Play: 3 puzzles for the quarantine-weary</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Sometimes you just want to unplug. But you still need to be entertained, right? We’ve got you covered. Three puzzles to print and play for the COVID-weary among us.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590193094766"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            

            
                
            
                
                    <li class="ListH-items-item" data-click="liH1promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="storyStack"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/lifestyle"    >Lifestyle</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/lifestyle/story/2020-05-22/la-affairs-ruth-mora-coronavirus-dating-relationships"    >L.A. Affairs: I’m over coronavirus — I want my love life back</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="L.A. Affairs: I’m over coronavirus — I want my love life back" href="https://www.latimes.com/lifestyle/story/2020-05-22/la-affairs-ruth-mora-coronavirus-dating-relationships"    >
    <img class="Image" alt="LAAffairs-WebLede.jpg" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/3cc9b65/2147483647/strip/true/crop/3000x1959+0+20/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F61%2F40%2Fb85c1795442b91c7fec448379abc%2Flaaffairs-weblede.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/lifestyle"    >Lifestyle</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/lifestyle/story/2020-05-22/la-affairs-ruth-mora-coronavirus-dating-relationships"    >L.A. Affairs: I’m over coronavirus — I want my love life back</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">At first corona-dating seemed like it might be fun. Distance builds interest, right? Wrong. There’s just so much sourdough and banana bread you can make. I need this to be over. </div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590154052357"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
                
                    <li class="ListH-items-item" data-click="liH2promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="storyStack"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/lifestyle"    >Lifestyle</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/lifestyle/story/2020-05-22/coronavirus-project-natural-dyes-using-kitchen-scraps-and-backyard-plants"    >I tie-dyed linens and T-shirts using onion skins and avocado pits: Here’s how</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="I tie-dyed linens and T-shirts using onion skins and avocado pits: Here’s how" href="https://www.latimes.com/lifestyle/story/2020-05-22/coronavirus-project-natural-dyes-using-kitchen-scraps-and-backyard-plants"    >
    <img class="Image" alt="la-hm-natural-plant-dye-projects.jpg" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/c7ac9f5/2147483647/strip/true/crop/2160x1411+0+15/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F0d%2Fa5%2Fa17cf71a4170867bc6bfb613151c%2Fla-hm-natural-plant-dye-projects.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/lifestyle"    >Lifestyle</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/lifestyle/story/2020-05-22/coronavirus-project-natural-dyes-using-kitchen-scraps-and-backyard-plants"    >I tie-dyed linens and T-shirts using onion skins and avocado pits: Here’s how</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Fight quarantine fatigue while upcycling T-shirts and napkins with natural dyes made from fruits and vegetables. Did we mention it’s free? </div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590153995867"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
                
                    <li class="ListH-items-item" data-click="liH3promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="storyStack"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/lifestyle"    >Lifestyle</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/lifestyle/story/2020-05-22/pandemic-persona-flowchart-adventure"    >Mask or no mask? Follow the flowchart and find your pandemic persona</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Mask or no mask? Follow the flowchart and find your pandemic persona" href="https://www.latimes.com/lifestyle/story/2020-05-22/pandemic-persona-flowchart-adventure"    >
    <img class="Image" alt="la-hm-pandemic-persona-flowchart-Web-Lead.jpg" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/c34b8cf/2147483647/strip/true/crop/2160x1411+0+15/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fbf%2F55%2F3412b7624cd5b3ef809f53bf0618%2Fla-hm-pandemic-persona-flowchart-web-lead.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/lifestyle"    >Lifestyle</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/lifestyle/story/2020-05-22/pandemic-persona-flowchart-adventure"    >Mask or no mask? Follow the flowchart and find your pandemic persona</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Are you a Super Spreader or a Superb Hero? Revealing your secret identity is just a few steps away.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590153942542"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
        </ul>
    
</div>

            </div>
        
        
            <div class="FourColumnContainer-column" data-click="4col3">
                
<div class="ListH"  data-list-id="0000016a-0df9-df32-abfb-4df9718e0001">
    <div class="ListH-header" >
    
        <div class="ListH-header-title"><a href="https://www.latimes.com/business" >Business<svg class="chevron"><use xlink:href="#chevron"></use></svg></a></div>
    
</div>


    
        <ul class="ListH-items">
            
                <li class="ListH-items-item" data-click="liH0promoSmall"
 data-hide-description
 data-hide-category
 data-hide-timestamp

 data-top-center


>
                <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/business"    >Business</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/business/newsletter/2020-05-23/hot-property-newsletter-real-estate-plows-through-the-pandemic-hot-property"    >Hot Property newsletter: Real estate plows through the pandemic</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Hot Property newsletter: Real estate plows through the pandemic" href="https://www.latimes.com/business/newsletter/2020-05-23/hot-property-newsletter-real-estate-plows-through-the-pandemic-hot-property"    >
    <img class="Image" alt="Home of the Week | Fully refreshed in Eagle Rock" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/41f309c/2147483647/strip/true/crop/5000x3333+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F6d%2F4e%2F2ddb856744f5b156a747a838ffbf%2Ffi-hp-home-eagle-rock-8.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/business"    >Business</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/business/newsletter/2020-05-23/hot-property-newsletter-real-estate-plows-through-the-pandemic-hot-property"    >Hot Property newsletter: Real estate plows through the pandemic</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Among those listing homes for sale are Tesla honcho Elon Musk, pro golfer Greg Norman and singer Kelly Clarkson. </div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590242421819"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            

            
                
            
                
                    <li class="ListH-items-item" data-click="liH1promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/business"    >Business</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/business/story/2020-05-23/turo-review-side-hustl"    >Review: Turo can be a money-maker — but don’t skimp on the insurance</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Review: Turo can be a money-maker — but don’t skimp on the insurance" href="https://www.latimes.com/business/story/2020-05-23/turo-review-side-hustl"    >
    <img class="Image" alt="Turo car rental valet lot on Tuesday, December 24, 2019 in Los Angeles, California. " width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/93e47c6/2147483647/strip/true/crop/5760x3762+0+39/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F9b%2Fc4%2Ff4043ff3471aba0d2be8e27e326a%2F476605-hy-turo-car-sharing-0013.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/business"    >Business</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/business/story/2020-05-23/turo-review-side-hustl"    >Review: Turo can be a money-maker — but don’t skimp on the insurance</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Turo allows you to rent out a spare car — or many spare cars — to travelers and neighbors. There’s money to be made, but take care when looking over the insurance policy.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590238803129"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
                
                    <li class="ListH-items-item" data-click="liH2promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/business/real-estate"    >Hot Property</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/business/real-estate/story/2020-05-23/hot-property-law-order-star-looks-to-sell-famous-tv-setting"    >Hot Property: ‘Law &amp; Order’ star looks to sell famous TV setting</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Hot Property: ‘Law &amp; Order’ star looks to sell famous TV setting" href="https://www.latimes.com/business/real-estate/story/2020-05-23/hot-property-law-order-star-looks-to-sell-famous-tv-setting"    >
    <img class="Image" alt="Hot Property | Tommy Thayer" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/67dcca0/2147483647/strip/true/crop/5000x3266+0+36/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fe5%2F77%2F51cab4dc43d8a941cf351471f5d9%2Ffi-hotprop-thayer-1.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/business/real-estate"    >Hot Property</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/business/real-estate/story/2020-05-23/hot-property-law-order-star-looks-to-sell-famous-tv-setting"    >Hot Property: ‘Law &amp; Order’ star looks to sell famous TV setting</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Actor Christopher Meloni of ‘Law &amp; Order’ fame has put his Hollywood Hills home, which was used as a filming location for ‘The Adventures of Ozzie and Harriet,’ on the market. Also: Kelly Clarkson is selling in Encino, and Tommy Thayer of KISS fame has listed his Lake Sherwood house.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590237031341"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
                
                    <li class="ListH-items-item" data-click="liH3promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/business"    >Business</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/business/story/2020-05-23/card-clubs-coronavirus-reopening-plan"    >Card clubs offer reopening plan as tribal and Vegas casinos get back in the game</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Card clubs offer reopening plan as tribal and Vegas casinos get back in the game" href="https://www.latimes.com/business/story/2020-05-23/card-clubs-coronavirus-reopening-plan"    >
    <img class="Image" alt="HAWAIIAN GARDENS CA. AUGUST 23, 2016: Card players try their luck at The Gardens Casino in Hawaiian" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/117e0e1/2147483647/strip/true/crop/1762x1151+143+0/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F5c%2F58%2F376d2178021e1a88ff0a7c58cb91%2Fla-1542654043-4pbzk47ekw-snap-image" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/business"    >Business</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/business/story/2020-05-23/card-clubs-coronavirus-reopening-plan"    >Card clubs offer reopening plan as tribal and Vegas casinos get back in the game</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Coronavirus: Card clubs are working on protocols for reopening</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590237004953"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
        </ul>
    
</div>

            </div>
        
        
            <div class="FourColumnContainer-column" data-click="4col4">
                
<div class="ListH"  data-list-id="0000016a-0dfa-dffa-a76b-3dfbb42a0001">
    <div class="ListH-header" >
    
        <div class="ListH-header-title"><a href="https://www.latimes.com/travel" >Travel<svg class="chevron"><use xlink:href="#chevron"></use></svg></a></div>
    
</div>


    
        <ul class="ListH-items">
            
                <li class="ListH-items-item" data-click="liH0promoSmall"
 data-hide-description
 data-hide-category
 data-hide-timestamp

 data-top-center


>
                <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/travel"    >Travel</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/travel/story/2020-05-22/nevada-casinos-reopen-june-4-if-no-coronavirus"    >Nevada casinos may reopen June 4 if coronavirus cases don’t spike this weekend</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Nevada casinos may reopen June 4 if coronavirus cases don’t spike this weekend" href="https://www.latimes.com/travel/story/2020-05-22/nevada-casinos-reopen-june-4-if-no-coronavirus"    >
    <img class="Image" alt="3075209_SP_VIVA-LAS-VEGAS_KKN" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/1da7e5b/2147483647/strip/true/crop/5760x3840+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F83%2Fb7%2F1e78b49f4c0e8a3664b0d0c19c16%2Flasvegas.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/travel"    >Travel</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/travel/story/2020-05-22/nevada-casinos-reopen-june-4-if-no-coronavirus"    >Nevada casinos may reopen June 4 if coronavirus cases don’t spike this weekend</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Nevada Gov. Steve Sisolak will make the final announcement Tuesday at a news conference. Vegas hotel-casinos look to reopen soon.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590198869495"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            

            
                
            
                
                    <li class="ListH-items-item" data-click="liH1promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="storyStack"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/travel"    >Travel</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/travel/story/2020-05-22/coronavirus-travel-game"    >Test your travel savvy with our fact-or-fiction quiz (coronavirus edition)</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Test your travel savvy with our fact-or-fiction quiz (coronavirus edition)" href="https://www.latimes.com/travel/story/2020-05-22/coronavirus-travel-game"    >
    <img class="Image" alt="la-tr-travel-spot-20200523.jpg" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/5cb526c/2147483647/strip/true/crop/2160x1411+0+15/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F2e%2Fbf%2Fa86feca148449eaf2fb5b82eb36d%2Fla-tr-travel-spot-20200523.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/travel"    >Travel</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/travel/story/2020-05-22/coronavirus-travel-game"    >Test your travel savvy with our fact-or-fiction quiz (coronavirus edition)</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Some odd things have happened in the travel world — but are they this odd? Use your nonsense detector to see whether you can sniff out the fiction.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590153833173"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
                
                    <li class="ListH-items-item" data-click="liH2promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="storyStack"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/travel"    >Travel</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/travel/story/2020-05-22/quarantine-travel-califorina-bingo"    >The ultimate California travel bingo board: Can you beat it?</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="The ultimate California travel bingo board: Can you beat it?" href="https://www.latimes.com/travel/story/2020-05-22/quarantine-travel-califorina-bingo"    >
    <img class="Image" alt="bingo.jpg" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/f4a6032/2147483647/strip/true/crop/1800x1176+0+12/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fd0%2F3f%2F47475c954e9ca05f05689c32da4f%2Fbingo-web.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/travel"    >Travel</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/travel/story/2020-05-22/quarantine-travel-califorina-bingo"    >The ultimate California travel bingo board: Can you beat it?</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Exploring the state has its sweet moments - as well as salty ones. We’ve turned it all into a bingo game. Did you help cause a Yosemite Valley traffic jam? Check.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590153732869"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
                
                    <li class="ListH-items-item" data-click="liH3promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/travel"    >Travel</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/travel/story/2020-05-21/joshua-tree-campers-memorial-day-weekend-coronavirus"    >Joshua Tree just opened, before a three-day weekend. Here’s what to expect</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Joshua Tree just opened, before a three-day weekend. Here’s what to expect" href="https://www.latimes.com/travel/story/2020-05-21/joshua-tree-campers-memorial-day-weekend-coronavirus"    >
    <img class="Image" alt="la-tr-joshuatree-hiddenvalley-camping" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/80892ed/2147483647/strip/true/crop/5568x3637+0+38/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Ff0%2F3a%2F88bfeb3149fb9789bd815762a96e%2Fcsr4421.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/travel"    >Travel</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/travel/story/2020-05-21/joshua-tree-campers-memorial-day-weekend-coronavirus"    >Joshua Tree just opened, before a three-day weekend. Here’s what to expect</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">The park’s reopening lures hundreds of impulse campers, and weekend hordes are possible. </div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 21, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590110510026"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
        </ul>
    
</div>

            </div>
        
    </div>
</div>



    <div class="FourColumnContainer">
    
    <div class="FourColumnContainer-row">
        
            <div class="FourColumnContainer-column" data-click="4col1">
                
<div class="ListH"  data-list-id="0000016a-0d86-df32-abfb-4db72eef0001">
    <div class="ListH-header" >
    
        <div class="ListH-header-title"><a href="https://www.latimes.com/entertainment-arts" >Entertainment &amp; Arts<svg class="chevron"><use xlink:href="#chevron"></use></svg></a></div>
    
</div>


    
        <ul class="ListH-items">
            
                <li class="ListH-items-item" data-click="liH0promoSmall"
 data-hide-description
 data-hide-category
 data-hide-timestamp

 data-top-center


>
                <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/entertainment-arts"    >Entertainment &amp; Arts</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/story/2020-05-23/coronavirus-what-to-watch-memorial-day-concert-pbs"    >National Memorial Day Concert with Cynthia Erivo: Your weekend quarantine must-watch</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="National Memorial Day Concert with Cynthia Erivo: Your weekend quarantine must-watch" href="https://www.latimes.com/entertainment-arts/story/2020-05-23/coronavirus-what-to-watch-memorial-day-concert-pbs"    >
    <img class="Image" alt="Cynthia Erivo" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/94c9c4d/2147483647/strip/true/crop/3462x2308+0+171/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F43%2F32%2Fa8e566b5452ab41ef98eb2f54287%2Fcynthiaerivo.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/entertainment-arts"    >Entertainment &amp; Arts</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/story/2020-05-23/coronavirus-what-to-watch-memorial-day-concert-pbs"    >National Memorial Day Concert with Cynthia Erivo: Your weekend quarantine must-watch</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">How to watch the “National Memorial Day Concert” featuring Cynthia Erivo, Renée Fleming, Trace Adkins and CeCe Winans, plus other holiday picks.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590242430865"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            

            
                
            
                
                    <li class="ListH-items-item" data-click="liH1promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/entertainment-arts"    >Entertainment &amp; Arts</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/story/2020-05-23/frank-marshall-coronavirus-movies-future-jurassic-world-dominion"    >Frank Marshall has hope for the future of filmmaking: ‘It’s just gonna look different’</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Frank Marshall has hope for the future of filmmaking: ‘It’s just gonna look different’" href="https://www.latimes.com/entertainment-arts/story/2020-05-23/frank-marshall-coronavirus-movies-future-jurassic-world-dominion"    >
    <img class="Image" alt="538192_ET-ZOO-MAGIC-SHOW-GEFFEN-FRANK-MARSHALL_KKN_19725.JPG" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/9daa01c/2147483647/strip/true/crop/3071x2006+2803+958/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F96%2F9b%2F94e0d3804b0a9ffa5bc6893dfa84%2Fla-photos-1staff-538192-et-zoo-magic-show-geffen-frank-marshall-kkn-19725.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/entertainment-arts"    >Entertainment &amp; Arts</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/story/2020-05-23/frank-marshall-coronavirus-movies-future-jurassic-world-dominion"    >Frank Marshall has hope for the future of filmmaking: ‘It’s just gonna look different’</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Veteran director and producer Frank Marshall talks about the halted production of “Jurassic World: Dominion” and filmmaking after COVID-19.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590242421299"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
                
                    <li class="ListH-items-item" data-click="liH2promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/entertainment-arts"    >Entertainment &amp; Arts</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/story/2020-05-22/pixar-first-gay-lead-character-out-short-disney-plus"    >Does ‘Out,’ new Pixar short with first Disney gay protagonist, answer LGBTQ inclusion call?</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Does ‘Out,’ new Pixar short with first Disney gay protagonist, answer LGBTQ inclusion call?" href="https://www.latimes.com/entertainment-arts/story/2020-05-22/pixar-first-gay-lead-character-out-short-disney-plus"    >
    <img class="Image" alt="la_et_out_pixar_animation_studios_33.JPG" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/14766a3/2147483647/strip/true/crop/1577x1030+171+0/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F3e%2F22%2F1ac0077d48cc8af5e9f08a32ee7e%2Fla-photos-handouts-la-et-out-pixar-animation-studios-33.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/entertainment-arts"    >Entertainment &amp; Arts</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/story/2020-05-22/pixar-first-gay-lead-character-out-short-disney-plus"    >Does ‘Out,’ new Pixar short with first Disney gay protagonist, answer LGBTQ inclusion call?</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">“Out,” streaming on Disney+, is a Pixar animated short with the studio’s first LGBTQ animated lead character who reveals his sexual orientation to his parents.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590199986343"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
                
                    <li class="ListH-items-item" data-click="liH3promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/entertainment-arts/movies"    >Movies</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/movies/story/2020-05-22/netflix-all-day-and-a-night-jeffrey-wright-joe-robert-cole"    >How Netflix’s ‘All Day and a Night’ dodges stereotypes to tell painful truths</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="How Netflix’s ‘All Day and a Night’ dodges stereotypes to tell painful truths" href="https://www.latimes.com/entertainment-arts/movies/story/2020-05-22/netflix-all-day-and-a-night-jeffrey-wright-joe-robert-cole"    >
    <img class="Image" alt="“All Day and a Night”" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/239f0d6/2147483647/strip/true/crop/6000x3919+0+41/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fa7%2F52%2Febaa5dd446e1af28549c48ad4ae8%2Fadaan-unit-02346r.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/entertainment-arts/movies"    >Movies</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/entertainment-arts/movies/story/2020-05-22/netflix-all-day-and-a-night-jeffrey-wright-joe-robert-cole"    >How Netflix’s ‘All Day and a Night’ dodges stereotypes to tell painful truths</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Joe Robert Cole’s Netflix drama “All Day and a Night” explores the intersection of toxic masculinity and systemic oppression. Cole and star Jeffrey Wright discuss how fathers in underserved communities are set up to fail and why.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590195145157"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
        </ul>
    
</div>

            </div>
        
        
            <div class="FourColumnContainer-column" data-click="4col2">
                
<div class="ListH"  data-list-id="0000016a-0d88-dffa-a76b-3debda810001">
    <div class="ListH-header" >
    
        <div class="ListH-header-title"><a href="https://www.latimes.com/california" >California<svg class="chevron"><use xlink:href="#chevron"></use></svg></a></div>
    
</div>


    
        <ul class="ListH-items">
            
                <li class="ListH-items-item" data-click="liH0promoSmall"
 data-hide-description
 data-hide-category
 data-hide-timestamp

 data-top-center


>
                <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/california-bars-wineries-distilleries-to-go-drinks"    >California just made it easier for bars, wineries, distilleries to offer to-go drinks</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="California just made it easier for bars, wineries, distilleries to offer to-go drinks" href="https://www.latimes.com/california/story/2020-05-23/california-bars-wineries-distilleries-to-go-drinks"    >
    <img class="Image" alt="APphoto_Virus Outbreak California" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/3e01d29/2147483647/strip/true/crop/3586x2391+0+75/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F00%2F41%2F4ec52a344ab8a8b45e62ca59c2fe%2Fapphoto-virus-outbreak-california-3.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/california-bars-wineries-distilleries-to-go-drinks"    >California just made it easier for bars, wineries, distilleries to offer to-go drinks</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">More California establishments can sell alcoholic beverages to go after the state relaxed a rule to help businesses during the coronavirus crisis.</div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590257722607"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            

            
                
            
                
                    <li class="ListH-items-item" data-click="liH1promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/earthquake-clovis-california"    >Magnitude 3.0 earthquake registered near Clovis, Calif.</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Magnitude 3.0 earthquake registered near Clovis, Calif." href="https://www.latimes.com/california/story/2020-05-23/earthquake-clovis-california"    >
    <img class="Image" alt="clovisquakemay23.jpg" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/93a58cc/2147483647/strip/true/crop/1200x784+0+8/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F78%2F47%2Fb932ee0e47c6beb7145f6dc6e526%2Fclovisquakemay23.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/earthquake-clovis-california"    >Magnitude 3.0 earthquake registered near Clovis, Calif.</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">A magnitude 3.0 earthquake was reported Friday night 54 miles from Clovis, Calif., according to the U.S. Geological Survey.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590247383601"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
                
                    <li class="ListH-items-item" data-click="liH2promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/ucla-coronavirus-crisis-management-class-zev-yaroslavsky"    >Teaching the coronavirus outbreak in Los Angeles as a crash course in crisis management</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Teaching the coronavirus outbreak in Los Angeles as a crash course in crisis management" href="https://www.latimes.com/california/story/2020-05-23/ucla-coronavirus-crisis-management-class-zev-yaroslavsky"    >
    <img class="Image" alt="2414026_me_yaroslavsky_profile_17_ALS.JPG" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/f2b549a/2147483647/strip/true/crop/2400x1568+0+57/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fzbk%2Fdamlat_images%2FLA%2FLA_PHOTO_SELECTS%2F2014_11%2F2414026_me_yaroslavsky_profile_17_ALS.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-23/ucla-coronavirus-crisis-management-class-zev-yaroslavsky"    >Teaching the coronavirus outbreak in Los Angeles as a crash course in crisis management</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description"> Former L.A. County Supervisor Zev Yaroslavsky turns a UCLA graduate seminar into a crash course in coronavirus crisis management</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590235216042"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
                
                    <li class="ListH-items-item" data-click="liH3promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-22/sees-candies-reopens-closed-candy-kitchens-despite-coronavirus-concerns"    >See’s Candies reopens candy kitchens, paying attention to coronavirus concerns </a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="See’s Candies reopens candy kitchens, paying attention to coronavirus concerns " href="https://www.latimes.com/california/story/2020-05-22/sees-candies-reopens-closed-candy-kitchens-despite-coronavirus-concerns"    >
    <img class="Image" alt="See’s Candies" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/d007c4e/2147483647/strip/true/crop/612x400+14+0/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Ff8%2F0c%2F29e0f3e856954ec7a3a1a70fc9e3%2Ftn-818-0823-sees-001" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-22/sees-candies-reopens-closed-candy-kitchens-despite-coronavirus-concerns"    >See’s Candies reopens candy kitchens, paying attention to coronavirus concerns </a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">After shutting down two months ago due to coronavirus concerns, See’s Candies is opening up candy kitchens in San Francisco and Los Angeles.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590209124873"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
        </ul>
    
</div>

            </div>
        
        
            <div class="FourColumnContainer-column" data-click="4col3">
                
<div class="ListH"  data-list-id="0000016a-0d8b-dffa-a76b-3deb959e0001">
    <div class="ListH-header" >
    
        <div class="ListH-header-title"><a href="https://www.latimes.com/sports" >Sports<svg class="chevron"><use xlink:href="#chevron"></use></svg></a></div>
    
</div>


    
        <ul class="ListH-items">
            
                <li class="ListH-items-item" data-click="liH0promoSmall"
 data-hide-description
 data-hide-category
 data-hide-timestamp

 data-top-center


>
                <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/sports/dodgers"    >Dodgers</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/sports/dodgers/story/2020-05-23/tony-gwynn-batting-eighth-great-lineups-can-lead-to-great-debates"    >Tony Gwynn batting eighth? Great lineups can lead to great debates</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Tony Gwynn batting eighth? Great lineups can lead to great debates" href="https://www.latimes.com/sports/dodgers/story/2020-05-23/tony-gwynn-batting-eighth-great-lineups-can-lead-to-great-debates"    >
    <img class="Image" alt="Tony Gwynn" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/3a39b12/2147483647/strip/true/crop/3022x2015+0+114/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F3f%2Fb1%2F56aedc484fea92504118c362c4d3%2Fap-9408070200.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/sports/dodgers"    >Dodgers</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/sports/dodgers/story/2020-05-23/tony-gwynn-batting-eighth-great-lineups-can-lead-to-great-debates"    >Tony Gwynn batting eighth? Great lineups can lead to great debates</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Dodgers manager Dave Roberts and San Francisco Giants manager Gabe Kapler answer questions on how they set their lineups for ‘the Golden Greats: I-5 Series.’</div>
      

      <div class="PromoSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590271961721"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            

            
                
            
                
                    <li class="ListH-items-item" data-click="liH1promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/sports/lakers"    >Lakers</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/sports/lakers/story/2020-05-23/lakers-guard-quinn-cook-kevin-durant-prince-georges-county-showtime"    >Markazi: Lakers guard Quinn Cook returns to roots for Showtime documentary</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Markazi: Lakers guard Quinn Cook returns to roots for Showtime documentary" href="https://www.latimes.com/sports/lakers/story/2020-05-23/lakers-guard-quinn-cook-kevin-durant-prince-georges-county-showtime"    >
    <img class="Image" alt="Quinn Cook" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/44e3108/2147483647/strip/true/crop/3300x2155+0+22/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F24%2F75%2F1c7b8a004967ba0e4ef5f02ad7a0%2Fapphoto-lakers-bulls-basketball.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/sports/lakers"    >Lakers</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/sports/lakers/story/2020-05-23/lakers-guard-quinn-cook-kevin-durant-prince-georges-county-showtime"    >Markazi: Lakers guard Quinn Cook returns to roots for Showtime documentary</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Lakers guard Quinn Cook teams up with Kevin Durant on filmmaking project.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590267760696"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
                
                    <li class="ListH-items-item" data-click="liH2promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/sports/soccer"    >Soccer</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/sports/soccer/story/2020-05-23/spains-la-liga-soccer-league-set-to-resume-in-june"    >Spain’s La Liga soccer league set to resume in June</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Spain’s La Liga soccer league set to resume in June" href="https://www.latimes.com/sports/soccer/story/2020-05-23/spains-la-liga-soccer-league-set-to-resume-in-june"    >
    <img class="Image" alt="Virus Outbreak Spain Soccer Restart" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/1333615/2147483647/strip/true/crop/3663x2392+0+25/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F87%2Fdf%2Ff1b51734478e98b023b4871deefd%2Fvirus-outbreak-spain-soccer-restart-01706.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/sports/soccer"    >Soccer</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/sports/soccer/story/2020-05-23/spains-la-liga-soccer-league-set-to-resume-in-june"    >Spain’s La Liga soccer league set to resume in June</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Spanish Prime Minister Pedro Sanchez announced Saturday that the soccer league in Spain will be allowed to resume June 8.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590248333899"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
                
                    <li class="ListH-items-item" data-click="liH3promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/sports/highschool"    >High School Sports</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/sports/highschool/story/2020-05-23/season-interrupted-cara"    >Season Interrupted: Cara Dunnigan has a shutdown epiphany</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Season Interrupted: Cara Dunnigan has a shutdown epiphany" href="https://www.latimes.com/sports/highschool/story/2020-05-23/season-interrupted-cara"    >
    <img class="Image" alt="Season Interrupted: Cara Dunnigan" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/db32393/2147483647/strip/true/crop/480x314+0+23/resize/320x209!/quality/90/?url=https%3A%2F%2Fi.ytimg.com%2Fvi%2FqbBoDIhDrnQ%2Fhqdefault.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/sports/highschool"    >High School Sports</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/sports/highschool/story/2020-05-23/season-interrupted-cara"    >Season Interrupted: Cara Dunnigan has a shutdown epiphany</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">The coronavirus shutdown forced two-sport star Cara Dunnigan to make a difficult choice. It also opened her eyes: ‘I’m so much more than sports.’</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 23, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590244983011"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
        </ul>
    
</div>

            </div>
        
        
            <div class="FourColumnContainer-column" data-click="4col4">
                
<div class="ListH"  data-list-id="0000016a-0d8d-df32-abfb-4dbd589c0001">
    <div class="ListH-header" >
    
        <div class="ListH-header-title"><a href="https://www.latimes.com/politics" >Politics<svg class="chevron"><use xlink:href="#chevron"></use></svg></a></div>
    
</div>


    
        <ul class="ListH-items">
            
                <li class="ListH-items-item" data-click="liH0promoSmall"
 data-hide-description
 data-hide-category
 data-hide-timestamp

 data-top-center


>
                <ps-promo class="PromoSmall"  data-content-type="article"
>
  <div class="PromoSmall-wrapper">
    <div class="PromoSmall-titleContainerDupe">
      

      
        
          <div class="PromoSmall-category">
            <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
          </div>
        
      

      
        <div class="PromoSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-22/coronavirus-memorial-day-trump-churches"    >Trump demands churches open, despite coronavirus fears, as Memorial Day weekend begins</a>

        </div>
      
    </div>

    <div class="PromoSmall-media">
      
        
          
              <a class="Link" aria-label="Trump demands churches open, despite coronavirus fears, as Memorial Day weekend begins" href="https://www.latimes.com/world-nation/story/2020-05-22/coronavirus-memorial-day-trump-churches"    >
    <img class="Image" alt="Virus Outbreak Memorial Day" width="840" height="560"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/a71ef26/2147483647/strip/true/crop/4629x3086+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fe8%2F6b%2Fc6ee56b74ae9925770f8fea96c79%2Fvirus-outbreak-memorial-day-68721.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      
    </div>

    <div class="PromoSmall-content">
      <div class="PromoSmall-titleContainer">
        

        
          
            <div class="PromoSmall-category">
              <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
            </div>
          
        

        
          <div class="PromoSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/world-nation/story/2020-05-22/coronavirus-memorial-day-trump-churches"    >Trump demands churches open, despite coronavirus fears, as Memorial Day weekend begins</a>

          </div>
        
      </div>

      
        <div class="PromoSmall-description">Memorial Day weekend traditionally means family barbecues, road trips, crowded parks and carefree days spent basking by the water, but Americans venturing out after weeks of sheltering in place are being asked not to let up their guard as the coronavirus continues to spread. </div>
      

      <div class="PromoSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590198617819"></div>

      
    </div>
  </div>
</ps-promo>

                </li>
            

            
                
            
                
                    <li class="ListH-items-item" data-click="liH1promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-22/california-churches-will-soon-have-rules-for-services-says-gavin-newsom"    >Newsom promises reopening plan for churches as Trump demands immediate action</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Newsom promises reopening plan for churches as Trump demands immediate action" href="https://www.latimes.com/california/story/2020-05-22/california-churches-will-soon-have-rules-for-services-says-gavin-newsom"    >
    <img class="Image" alt="537303-tn-dpt-me-hb-huntington-protest-20200510-3" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/0d05e66/2147483647/strip/true/crop/3600x2351+0+24/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F72%2F60%2F69d115d14d8b87cdde7c919b904b%2F537303-tn-dpt-me-hb-huntington-protest-20200510-3.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-22/california-churches-will-soon-have-rules-for-services-says-gavin-newsom"    >Newsom promises reopening plan for churches as Trump demands immediate action</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">Newsom promises reopening plan for churches as Trump demands immediate action.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590185186184"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
                
                    <li class="ListH-items-item" data-click="liH2promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/california"    >California</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-22/california-economic-crisis-might-mean-pay-cuts-for-lawmakers-state-workers"    >Coronavirus could force pay cuts for California lawmakers, state workers</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="Coronavirus could force pay cuts for California lawmakers, state workers" href="https://www.latimes.com/california/story/2020-05-22/california-economic-crisis-might-mean-pay-cuts-for-lawmakers-state-workers"    >
    <img class="Image" alt="California State Assembly" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/5c31135/2147483647/strip/true/crop/3936x2571+0+27/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F22%2F19%2F80525b54426e82a5bc6e4e09cdb9%2F20190912-cacapital-robertgourley-15.jpg" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/california"    >California</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/california/story/2020-05-22/california-economic-crisis-might-mean-pay-cuts-for-lawmakers-state-workers"    >Coronavirus could force pay cuts for California lawmakers, state workers</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">The budget crisis caused by the coronavirus outbreak could mean pay cuts for California lawmakers and state workers.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590174324648"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
                
                    <li class="ListH-items-item" data-click="liH3promoXSmall" data-hide-img
 data-hide-description
 data-hide-category

 data-hide-more-coverage



>
                        <ps-promo class="PromoXSmall"  data-content-type="article"
>
  <div class="PromoXSmall-wrapper">
    <div class="PromoXSmall-titleContainerDupe">
      

      
        
          <div class="PromoXSmall-category">
            <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
          </div>
        
      

      
        <div class="PromoXSmall-title">
          
    <a class="Link"  href="https://www.latimes.com/politics/story/2020-05-22/coronavirus-shutdowns-consumers-unpaid-utility-bills-loom-as-costly-problem"    >States are reopening from coronavirus shutdowns. What happens to frozen utility payments?</a>

        </div>
      
    </div>

    
      <div class="PromoXSmall-media">
        
          
            <a class="Link" aria-label="States are reopening from coronavirus shutdowns. What happens to frozen utility payments?" href="https://www.latimes.com/politics/story/2020-05-22/coronavirus-shutdowns-consumers-unpaid-utility-bills-loom-as-costly-problem"    >
    <img class="Image" alt="3079757_ME_illegal-weed-shops_AJS" width="320" height="209"
        data-src="https://ca-times.brightspotcdn.com/dims4/default/38a5699/2147483647/strip/true/crop/5100x3331+0+35/resize/320x209!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Ffb%2F15%2F7498e67c4aa295ac059f24de21ec%2F3079757-la-me-illegal-weed-shops-16-ajs.JPG" data-lazy-load="true" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">

</a>
          
        
      </div>
    

    <div class="PromoXSmall-content">
      <div class="PromoXSmall-titleContainer">
        

        
          
            <div class="PromoXSmall-category">
              <a class="Link"  href="https://www.latimes.com/world-nation"    >World &amp; Nation</a>
            </div>
          
        

        
          <div class="PromoXSmall-title">
            
    <a class="Link"  href="https://www.latimes.com/politics/story/2020-05-22/coronavirus-shutdowns-consumers-unpaid-utility-bills-loom-as-costly-problem"    >States are reopening from coronavirus shutdowns. What happens to frozen utility payments?</a>

          </div>
        
      </div>

      
        <div class="PromoXSmall-description">A wave of unpaid utility bills coming due will not only saddle Americans still out of work with new debt, it could also drive up rates for everyone.</div>
      

      
        
      

      <div class="PromoXSmall-timestamp" data-date="May 22, 2020" data-shouldShowDate="true" data-shouldShowTime="true" data-timestamp="1590183694978"></div>

      
    </div>
  </div>
</ps-promo>

                    </li>
                
            
        </ul>
    
</div>

            </div>
        
    </div>
</div>


<div class="GoogleDfpAd-wrapper">
    <div class="GoogleDfpAd-adCaption">Advertisement</div>
    <div id="googleAdd14e9ae2-92ab-4555-ace5-228f84cb654d" class="GoogleDfpAd" data-slot-name="/21787098806/web.latimes/homepage" data-slot-sizes="[[970, 90], [728, 90], [970, 250]]" data-ad-type="leaderboard" data-ptype="sectionfront" data-slot-adSizeMap="[[[1024, 0], [728, 90]], [[800, 0], [728, 90]], [[0, 0], [320, 50], [320, 100]], [[1241, 0], [970, 90], [728, 90]]]">
        <span class="GoogleDfpAd-placeholder"></span>
    </div>
</div>

            </main>

            

        </div>

        
    <footer class="Page-footer">
        <div class="Page-footer-content">
            
                <div class="Page-footer-logo"><a aria-label="home page" href="https://www.latimes.com/"  >
    
        <img class="PageLogo-image" src="https://ca-times.brightspotcdn.com/0e/c6/b86a8b4b43a793259deb28a32a56/latlogoinverse.svg" alt="Los Angeles Times" width="959"  height="120" />
    
    </a>
</div>
            

            <div class="Page-footer-columns">
                <div class="Page-footer-column">
                    
                        <div class="Page-footer-content">
                            
    <div class="RichTextModule">
        
            <div class="RichTextModule-items RichTextBody"><p><u><a class="Link"  href="https://www.latimes.com/footersubscribe"  target="_blank"    >Subscribe for unlimited access</a></u></p></div>
        

    </div>

                        </div>
                    
                    
                        <div class="Page-social"><div class="SocialBar">
    <div class="SocialBar-heading">Follow Us</div>

    
        <ul class="SocialBar-items">
            
                <li class="SocialBar-items-item"> <a class="SocialLink" rel="noreferrer" href="https://twitter.com/latimes" target="_blank" data-social-service="twitter"><svg><use xlink:href="#mono-icon-twitter"></use></svg><span class="sr-only">twitter</span></a>
</li>
            
                <li class="SocialBar-items-item"> <a class="SocialLink" rel="noreferrer" href="https://www.instagram.com/latimes/" target="_blank" data-social-service="instagram"><svg><use xlink:href="#mono-icon-instagram"></use></svg><span class="sr-only">instagram</span></a>
</li>
            
                <li class="SocialBar-items-item"> <a class="SocialLink" rel="noreferrer" href="https://www.youtube.com/losangelestimes" target="_blank" data-social-service="youtube"><svg><use xlink:href="#mono-icon-youtube"></use></svg><span class="sr-only">youtube</span></a>
</li>
            
                <li class="SocialBar-items-item"> <a class="SocialLink" rel="noreferrer" href="https://www.facebook.com/latimes" target="_blank" data-social-service="facebook"><svg><use xlink:href="#mono-icon-facebook"></use></svg><span class="sr-only">facebook</span></a>
</li>
            
        </ul>
    
</div>
</div>
                    
                </div>
                <div class="Page-footer-column">
                    
                        <div class="Page-footer-navigation">
                            <nav class="FooterNavigation" >
    
        <ul class="FooterNavigation-items">
            
                <li class="FooterNavigation-items-item" data-click="navf0">
                    <div class="FooterNavigationItem" >
    
        <ul class="FooterNavigationItem-items">
            
                <li class="FooterNavigationItem-items-item">
    <a class="NavigationLink" href="https://enewspaper.latimes.com" target="_blank" rel="noopener">eNewspaper</a>
</li>
            
                <li class="FooterNavigationItem-items-item">
    <a class="NavigationLink" href="https://jobs.latimes.com" target="_blank" rel="noopener">Find/Post Jobs</a>
</li>
            
                <li class="FooterNavigationItem-items-item">
    <a class="NavigationLink" href="https://www.latimes.com/about/for-the-record/">For the Record</a>
</li>
            
                <li class="FooterNavigationItem-items-item">
    <a class="NavigationLink" href="https://placeanad.latimes.com" target="_blank" rel="noopener">Place an Ad</a>
</li>
            
                <li class="FooterNavigationItem-items-item">
    <a class="NavigationLink" href="https://mediakit.latimes.com" target="_blank" rel="noopener">Why L.A. Times?</a>
</li>
            
        </ul>
    
</div>
                </li>
            
                <li class="FooterNavigation-items-item" data-click="navf1">
                    <div class="FooterNavigationItem" >
    
        <ul class="FooterNavigationItem-items">
            
                <li class="FooterNavigationItem-items-item">
    <a class="NavigationLink" href="https://www.latimes.com/games/daily-crossword">Crossword</a>
</li>
            
                <li class="FooterNavigationItem-items-item">
    <a class="NavigationLink" href="https://www.latimes.com/obituaries">Obituaries</a>
</li>
            
                <li class="FooterNavigationItem-items-item">
    <a class="NavigationLink" href="https://www.latimes.com/california/story/2019-07-16/los-angeles-times-podcasts" target="_blank">Podcasts</a>
</li>
            
                <li class="FooterNavigationItem-items-item">
    <a class="NavigationLink" href="https://www.latimes.com/food/recipes">Recipes</a>
</li>
            
                <li class="FooterNavigationItem-items-item">
    <a class="NavigationLink" href="https://www.bestcovery.com/" target="_blank" rel="noopener">Bestcovery</a>
</li>
            
        </ul>
    
</div>
                </li>
            
                <li class="FooterNavigation-items-item" data-click="navf2">
                    <div class="FooterNavigationItem" >
    
        <ul class="FooterNavigationItem-items">
            
                <li class="FooterNavigationItem-items-item">
    <a class="NavigationLink" href="https://www.latimes.com/about">About/Contact</a>
</li>
            
                <li class="FooterNavigationItem-items-item">
    <a class="NavigationLink" href="https://nantmedia.wd5.myworkdayjobs.com/LATimesCareers" target="_blank">L.A. Times Careers</a>
</li>
            
                <li class="FooterNavigationItem-items-item">
    <a class="NavigationLink" href="https://myaccount2.latimes.com/index.aspx" target="_blank" rel="noopener">Manage Subscription</a>
</li>
            
                <li class="FooterNavigationItem-items-item">
    <a class="NavigationLink" href="https://www.latimes.com/about/la-reprint-request-splash-htmlstory.html">Reprints and Permissions</a>
</li>
            
                <li class="FooterNavigationItem-items-item">
    <a class="NavigationLink" href="https://www.latimes.com/sitemap" target="_blank">Site Map</a>
</li>
            
        </ul>
    
</div>
                </li>
            
        </ul>
    
</nav>
                        </div>
                    
                </div>
            </div>

            
                <div class="Page-footer-disclaimer">Copyright © 2020, Los Angeles Times | <a class="Link"  href="https://www.latimes.com/terms-of-service"    >Terms of Service</a> | <a class="Link"  href="https://www.latimes.com/privacy-policy"    >Privacy Policy</a> | <a class="Link"  href="https://www.latimes.com/privacy-policy#california-notice-of-collection"  target="_blank"    >CA Notice of Collection</a> | <a class="Link"  href="https://membership.latimes.com/privacy-settings"  target="_blank"    >Do Not Sell My Info</a></div>
            
        </div>
    </footer>


        
    </body>
</html>
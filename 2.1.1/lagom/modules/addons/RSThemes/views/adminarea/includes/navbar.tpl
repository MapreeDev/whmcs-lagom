<div class="app-navbar navbar navbar--main navbar--h">
    <div class="container">
        <a class="navbar__brand brand" href="{$helper->url('Templates@index')}">
            <div class="brand__logo">
                <img src="{$helper->img('logos/logo-black.svg')}" alt="RSStudio" width="128">
            </div>
        </a>
        <div class="navbar__menu">
            <ul class="nav nav--md nav--h is-right align-items-center">
                <li class="nav__item">
                    <a class="btn btn--navbar" href="https://rsstudio.net/my-account/submitticket.php" target="_blank">
                        <i class="lm lm-chat-clouds btn__icon"></i>
                        <span class="btn__text">{$lang.navigation.contact_us}</span>
                    </a>
                </li>
                <li class="nav__item">
                    <a class="btn btn--navbar" href="https://rsstudio.net/my-account/" target="_blank">
                        <i class="lm lm-user btn__icon"></i>
                        <span class="btn__text">{$lang.navigation.my_account}</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>

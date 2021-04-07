@if (!request()->is('student/*'))
    <div class="header-top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6">
                    <div class="header-widget header-widget1">
                        <ul class="contact-info d-flex align-items-center">
                        <li><a href="mailto:{{getSystemSetting('type_mail')->value}}"                                   class="mail"> <span class="la la-envelope-o"></span> {{getSystemSetting('type_mail')->value}}</a></li>
                            @if (env('FORUM_PANEL') === 'YES')
                            <!--<li><a href="{{ route('forum.index') }}" target="_blank"> <i class="fa fa-comments-o" aria-hidden="true"></i> Forum</a></li>-->
                            @endif

                        </ul>
                    </div><!-- end header-widget -->
                </div><!-- end col-lg-6 -->
                <div class="col-lg-6">
                    <div class="header-widget header-widget2 d-flex align-items-center justify-content-end">                         
       
                        <div class="header-right-info d-flex align-items-center">
                            @guest()
                                <ul class="user-action d-flex align-items-center mr-10">
                                    <li><a href="{{ route('login') }}">@translate(Login)</a></li>
                                </ul>
                            @endguest
                        </div>
                    </div><!-- end header-widget -->
                </div><!-- end col-lg-6 -->
            </div><!-- end row -->
        </div><!-- end container-fluid -->
    </div><!-- end header-top -->
@endif

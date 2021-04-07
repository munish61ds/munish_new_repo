@extends('frontend.app')
@section('content')


    <!--================================
         START SLIDER AREA
=================================-->
    <section class="slider-area slider-area2">
        <div class="homepage-slide2">
            @foreach($sliders as $item)
                <div class="single-slide-item" >
                    <div id="perticles-js-2" style="    background-color: #00004f;"></div>
                    <div class="slide-item-table">
                        <div class="slide-item-tablecell">
                            <div class="container">
                                <div class="row">
                                          <div class="col-lg-7">
                                       <img src="{{ filePath($item->image) }}" style="height: 615px;
    /* width: 566px; */
    margin-left: -261px;
    margin-top: -139px;">
                                       </div>
									   
                                    <div class="col-lg-5">
                                        <div class="section-heading" style="    margin-top: 54px;">
                                            <h2 class="section__title" style="font-size: 55px;
    line-height: 61px;
    ">{{$item->title}}</h2>
                                            <p class="section__desc" style="color: #fff700;
    font-size: 22px;
    font-weight: bold;">
                                                {{$item->sub_title}}
                                            </p>
                                        </div>
                                        <!--<div class="hero-search-form">-->
                                        <!--    <div class="contact-form-action">-->
                                        <!--        <form>-->
                                        <!--            <div class="input-box">-->
                                        <!--                <div class="form-group mb-0">-->
                                                            <!-- Search bar -->
                                        <!--                    <input class="form-control" id="slider-search" type="text"-->
                                        <!--                           name="search"-->
                                        <!--                           placeholder="@translate(Search for anything)">-->
                                        <!--                    <span class="la la-search search-icon"></span>-->

                                                            <!-- Search bar END - -->

                                                            <!-- ======================== Search Suggession ============================= -->
                                        <!--                    <div class="overflow-hidden search-list w-100">-->
                                        <!--                        <div id="appendSearchCart2"></div>-->
                                        <!--                    </div>-->

                                        <!--                </div>-->
                                        <!--            </div><!-- end input-box 
                                        <!--        </form>-->
                                        <!--    </div><!-- end contact-form-action
                                        <!--</div>-->
                                    </div><!-- col-lg-6 -->
                                </div><!-- row -->
                            </div><!-- container -->


                            <div class="our-post-content" style="    margin-top: 0px;">
                                <span class="hw-circle"></span>
                                <span class="hw-circle"></span>
                                <span class="hw-circle"></span>
                                <div class="how-we-work-wrap">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="our-post-item">
                                                    <i class="la la-mouse-pointer icon-element"></i>
                                                    <div class="our__text">
                                                        <h4 class="widget-title">{{number_format(\App\Model\Course::Published()->where('is_published',true)->count())}}
                                                            @translate(Online courses)</h4>
                                                        <p>@translate(Explore a variety of fresh topics)</p>
                                                    </div><!-- our__text -->
                                                </div><!-- our-post-item -->
                                            </div><!-- col-lg-4 -->
                                            <div class="col-lg-4">
                                                <div class="our-post-item">
                                                    <i class="la la-users icon-element"></i>
                                                    <div class="our__text">
                                                        <h4 class="widget-title">@translate(Expert Instruction)</h4>
                                                        <p>@translate(Find the right instructor for you)</p>
                                                    </div><!-- our__text -->
                                                </div><!-- our-post-item -->
                                            </div><!-- col-lg-4 -->
                                            <div class="col-lg-4">
                                                <div class="our-post-item">
                                                    <i class="fa fa-history icon-element"></i>
                                                    <div class="our__text">
                                                        <h4 class="widget-title">@translate(Lifetime access)</h4>
                                                        <p>@translate(Learn on your schedule)</p>
                                                    </div><!-- our__text -->
                                                </div><!-- our-post-item -->
                                            </div><!-- col-lg-4 -->
                                        </div><!-- row -->
                                    </div>
                                </div><!-- end how-we-work-wrap -->
                            </div><!-- our-post-content -->
                        </div><!-- slide-item-tablecell -->
                    </div><!-- slide-item-table -->
                </div><!-- end single-slide-item -->
            @endforeach
        </div><!-- end homepage-slides -->
    </section>
    <!--================================
            END SLIDER AREA
    =================================-->


    <!--======================================
           START LatestCourse AREA
   ======================================-->
    <section class="course-area padding-top-120px">
        <div class="course-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-heading text-center">
                            <h5 class="section__meta">@translate(Our New Courses For You)</h5>
                            <h2 class="section__title">@translate(Latest Courses)</h2>
                            <span class="section-divider"></span>
                        </div><!-- end section-heading -->
                    </div><!-- end col-lg-12 -->
                </div><!-- end row -->
                <div class="row margin-top-28px">
                    <div class="col-lg-12">
                        <div class="tab-content">
                            <div class="course-carousel">
                                @foreach($latestCourses as $l_course)
                                    <div class="card-item card-preview"
                                         data-tooltip-content="#tooltip_content_{{$l_course->id}}">
                                        <div class="card-image">
                                            <a href="{{route('course.single',$l_course->slug)}}"
                                               class="card__img"><img
                                                    src="{{ filePath($l_course->image) }}"
                                                    alt="{{$l_course->title}}"></a>
                                            @if(bestSellingTags($l_course->id))
                                                <div class="card-badge">
                                                                    <span
                                                                        class="badge-label">@translate(bestseller)</span>
                                                </div>
                                            @endif
                                        </div><!-- end card-image -->
                                        <div class="card-content">
                                            <p class="card__label">
                                                <span class="card__label-text">{{$l_course->level}}</span>
                                                @auth()
                                                    <a href="#!"
                                                       onclick="addToCart({{$l_course->id}},'{{route('add.to.wishlist')}}')"
                                                       class="card__collection-icon love-{{$l_course->id}}"><span
                                                            class="la la-heart-o love-span-{{$l_course->id}}"></span></a>
                                                @endauth

                                                @guest()
                                                    <a href="{{route('login')}}"
                                                       class="card__collection-icon"
                                                       data-toggle="tooltip" data-placement="top"
                                                       title="Add to Wishlist"><span
                                                            class="la la-heart-o"></span></a>
                                                @endguest
                                            </p>
                                            <h3 class="card__title">
                                                <a href="{{route('course.single',$l_course->slug)}}">{{\Illuminate\Support\Str::limit($l_course->title,58)}}</a>
                                            </h3>
                                            <p class="card__author">
                                                <a href="{{route('single.instructor',$l_course->relationBetweenInstructorUser->slug)}}">{{$l_course->relationBetweenInstructorUser->name}}</a>
                                            </p>
                                            <div class="rating-wrap d-flex mt-2 mb-3">
                                                    <span class="star-rating-wrap">
                                                     @translate(Enrolled) <span
                                                            class="star__count">{{\App\Model\Enrollment::where('course_id',$l_course->id)->count()}}</span>
                                                  </span>
                                            </div><!-- end rating-wrap -->
                                            <div class="card-action">
                                                <ul class="card-duration d-flex justify-content-between align-items-center">
                                                    <li>
                                                          <span class="meta__date">
                                                              <i class="la la-play-circle"></i> {{$l_course->classes->count()}} @translate(Classes)
                                                          </span>
                                                    </li>
                                                    <li>
                                                          <span class="meta__date">
                                                              @php
                                                                  $total_duration = 0;
                                                                  foreach ($l_course->classes as $item){
                                                                      $total_duration +=$item->contents->sum('duration');
                                                                  }
                                                              @endphp
                                                              <i class="la la-clock-o"></i>{{duration($total_duration)}}

                                                          </span>
                                                    </li>
                                                </ul>
                                            </div><!-- end card-action -->
                                            <div
                                                class="card-price-wrap d-flex justify-content-between align-items-center">
                                                <!--if free-->
                                                @if($l_course->is_free)
                                                    <span class="card__price">@translate(Free)</span>
                                                @else
                                                    @if($l_course->is_discount)
                                                        <span class="card__price">{{formatPrice($l_course->discount_price)}}</span>
                                                        <span class="card__price"><del>{{formatPrice($l_course->price)}}</del></span>
                                                    @else
                                                        <span
                                                            class="card__price">{{formatPrice($l_course->price)}}</span>
                                                    @endif
                                                @endif
                                            <!--there are the login-->
                                                @auth()
                                                    @if(\Illuminate\Support\Facades\Auth::user()->user_type == 'Student')
                                                        <a href="#!" class="text-btn addToCart-{{$l_course->id}}"
                                                           onclick="addToCart({{$l_course->id}},'{{route('add.to.cart')}}')">@translate(Add to cart)</a>
                                                    @else
                                                        <a href="{{route('login')}}" class="text-btn">@translate(Add to cart)</a>
                                                    @endif
                                                @endauth

                                                @guest()
                                                    <a href="{{route('login')}}" class="text-btn">@translate(Add to cart)</a>
                                                @endguest


                                            </div><!-- end card-price-wrap -->
                                        </div><!-- end card-content -->
                                    </div>
                                @endforeach
                            </div><!-- end course-carousel -->
                        </div><!-- end tab-content -->
                    </div><!-- end col-lg-12 -->
                </div><!-- end row -->
            </div><!-- end container -->
        </div><!-- end course-wrapper -->
    </section><!-- end courses-area -->
    @foreach($latestCourses as $l_c_tooltip)
        <div class="tooltip_templates">
            <div id="tooltip_content_{{$l_c_tooltip->id}}">
                <div class="card-item">
                    <div class="card-content">
                        <p class="card__author">
                            @translate(By) <a
                                href="{{route('single.instructor',$l_c_tooltip->relationBetweenInstructorUser->slug)}}">{{$l_c_tooltip->relationBetweenInstructorUser->name}}</a>
                        </p>
                        <h3 class="card__title">
                            <a href="{{route('course.single',$l_c_tooltip->slug)}}">{{\Illuminate\Support\Str::limit($l_c_tooltip->title,58)}}</a>
                        </h3>
                        <p class="card__label">
                            <span class="mr-1">@translate(in)</span><a
                                href="{{route('course.category',$l_c_tooltip->category->slug)}}"
                                class="mr-1">{{$l_c_tooltip->category->name}}</a>
                        </p>
                        <div class="rating-wrap d-flex mt-2 mb-3">

                                                                    <span class="star-rating-wrap">
                                                             @translate(Enrolled) <span
                                                                            class="star__count">{{\App\Model\Enrollment::where('course_id',$l_c_tooltip->id)->count()}}</span>
                                                        </span>
                        </div><!-- end rating-wrap -->
                        <ul class="list-items mb-3 font-size-14">
                            @foreach(json_decode($l_c_tooltip->requirement) as $requirement)
                                <li>{{$requirement}}</li>
                            @endforeach

                        </ul>
                        <div class="card-action">
                            <ul class="card-duration d-flex justify-content-between align-items-center">
                                <li><span class="meta__date"><i
                                            class="la la-play-circle"></i> {{$l_c_tooltip->classes->count()}} @translate(Classes)</span>
                                </li>
                                <li><span class="meta__date">
                                                                    @php
                                                                        $total_duration = 0;
                                                                        foreach ($l_c_tooltip->classes as $item){
                                                                            $total_duration +=$item->contents->sum('duration');
                                                                        }
                                                                    @endphp
                                                                    <i class="la la-clock-o"></i>{{duration($total_duration)}}
                                          </span>
                                </li>
                            </ul>
                        </div><!-- end card-action -->
                        <div class="btn-box w-100 text-center mb-3">
                            <a href="{{route('course.single',$l_c_tooltip->slug)}}"
                               class="theme-btn d-block">
                                @translate(Preview this course)</a>
                        </div>
                    </div><!-- end card-content -->
                </div><!-- end card-item -->
            </div>
        </div>
    @endforeach
    <!--======================================
            END LatestCourse AREA
    ======================================-->


    <!--======================================
            START CATEGORY AREA
    ======================================-->
    <section class="category-area padding-bottom-90px padding-top-90px">
        <div class="container">
            <div class="row">
                <div class="col-lg-9">
                    <div class="section-heading">
                        <h5 class="section__meta">@translate(Categories)</h5>
                        <h2 class="section__title">@translate(Popular Categories)</h2>
                        <span class="section-divider"></span>
                    </div><!-- end section-heading -->
                </div><!-- end col-lg-9 -->
                <div class="col-lg-3">
                    <div class="btn-box h-100 d-flex align-items-center justify-content-end">
                        <a href="{{route('course.filter')}}" class="theme-btn">@translate(all Categories)</a>
                    </div><!-- end btn-box-->
                </div>
            </div><!-- end row -->
            <div class="category-wrapper margin-top-28px">
                <div class="row">
                    @foreach($popular_cat as $item)
                        <div class="col-lg-4 column-td-half">
                            <div class="category-item">
                                <img data-original="{{ filePath($item->icon) }}" alt="" width="auto" height="200">
                                <div class="category-content">
                                    <div class="category-inner">
                                        <h3 class="cat__title"><a href="{{route('course.category',$item->slug)}}">{{$item->name}}</a></h3>
                                        <p class="cat__meta">{{$item->courses->count()}} @translate(Course(s))</p>
                                        <a href="{{route('course.category',$item->slug)}}" class="theme-btn">@translate(explore now)</a>
                                    </div>
                                </div><!-- end category-content -->
                            </div><!-- end category-item -->
                        </div><!-- end col-lg-4 -->
                    @endforeach
                </div><!-- end row -->
            </div><!-- end category-wrapper -->
        </div><!-- end container -->
        </div><!-- end course-wrapper -->
    </section>
    <!-- end courses-area -->
    <!--======================================
            END CATEGORY AREA
    ======================================-->
    <!--======================================
            START COURSE AREA
    ======================================-->

    <!--======================================
            END COURSE AREA
    ======================================-->

    <!--======================================
            START COURSE AREA
    ======================================-->
   
    <!--======================================
                END COURSE AREA
        ======================================-->


    <!--======================================
            START PACKAGE AREA
    ======================================-->
    <section class="choose-area section-padding text-center">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-heading">
                       
                        <h2 class="section__title">Why Languafina</h2>
                        <span class="section-divider"></span>
                    </div><!-- end section-heading -->
                </div><!-- end col-md-12 -->
            </div><!-- end row -->
            <div class="row">
               <p>Languafina specializes in perfecting the art of the English language.
We, as a firm, provide the necessary means to achieve the desired
command of the language. Furthermore, enhancement of flow, vocabulary,
pronunciation, and confidence in making use of English in every possible
way is what we focus on. We provide lessons in Spoken English which are
conducted via audio calls. This, hence, allows aspirants the opportunity to
speak with the trainers even without any access to the internet!
Moreover, we help in the preparation of various English proficiency tests
such as IELTS, PTE, and TOEFL.
</p><p>
Why Languafina?
We, at Languafina, appreciate the eagerness to learn. What sets us apart
from other teaching, institutes is our usage of new methods and advanced
technology that is available in today’s modern era. We are kicking the
obsolete routines and procedures to the curb and are adopting the latest
techniques required to achieve efficiency in order to succeed in today’s fast
paced world.</p>
            </div><!-- end row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="btn-box mt-3 d-flex align-items-center justify-content-center text-left">
                        <div class="btn-box-inner mr-3">
                            <span class="d-block mb-2 font-weight-semi-bold">@translate(Are you instructor?)</span>
                            <a href="{{route('instructor.register')}}" class="theme-btn line-height-40 text-capitalize">@translate(Start teaching)</a>
                        </div>
                        @guest
                            <div class="btn-box-inner">
                                <span class="d-block mb-2 font-weight-semi-bold">@translate(Are you student?)</span>
                                <a href="{{route('login')}}" class="theme-btn line-height-40 text-capitalize">@translate(Start learning)</a>
                            </div>
                        @endguest
                    </div>
                </div><!-- end col-lg-12 -->
            </div><!-- end row -->
        </div><!-- end container -->
    </section><!-- end package-area -->
    <!--======================================
            END PACKAGE AREA
    ======================================-->

    <div class="section-block"></div>





    <!--======================================
            START SUBSCRIPTION AREA
    ======================================-->
@if (subscriptionActive())

  <section class="package-area section--padding">
    <div class="container">
        <div class="row">

        @foreach ($subscriptions as $subscription)
            <div class="col-lg-4 column-td-half">
                <div class="package-item package-item-active">

                @if ($subscription->popular == true)
                     <div class="package-tooltip">
                        <span class="package__tooltip">Recommended</span>
                    </div><!-- end package-tooltip -->
                @endif

                    <div class="package-title text-center">
                        <h3 class="package__price"><span>{{ formatPrice($subscription->price) }}</span></h3>
                        <h3 class="package__title">{{ $subscription->name }}</h3>
                    </div><!-- end package-title -->

                    <ul class="list-items margin-bottom-35px">
                        @foreach (json_decode($subscription->description) as $item)
                            <li><i class="la la-check"></i> {{ $item }}</li>
                        @endforeach
                    </ul>

                    <div class="btn-box">
                        <a href="{{ route('subscription.frontend', $subscription->duration) }}" class="theme-btn">{{ App\SubscriptionCourse::where('subscription_duration','LIKE','%'.$subscription->duration.'%')->count() }} Courses</a>
                        <form action="{{ route('subscription.cart') }}" method="get">
                            @csrf

                            <input type="hidden" value="{{ $subscription->duration }}" name="subscription_package">
                            <input type="hidden" value="{{ $subscription->price }}" name="subscription_price">
                            <input type="hidden" value="{{ $subscription->id }}" name="subscription_id">
                            @foreach (App\SubscriptionCourse::where('subscription_duration','LIKE','%'.$subscription->duration.'%')->get() as $item)
                                <input type="hidden" name="course_id[]" value="{{ $item->course_id }}">
                            @endforeach

                            @auth
                                @if (!App\SubscriptionEnrollment::where('user_id', Auth::user()->id)->where('subscription_package', $subscription->duration)->exists())
                                <button type="submit" class="theme-btn mt-3">choose plan</button>
                                @else
                                <button type="button" disabled class="theme-btn mt-3">Purchased</button>
                                @endif
                            @endauth

                            @guest
                                <a href="{{ route('login') }}" class="theme-btn mt-3">choose plan</a>
                            @endguest




                        </form>
                        <p class="package__meta">no hidden charges!</p>
                    </div>

                </div><!-- end package-item -->
            </div><!-- end col-lg-4 -->
        @endforeach

        </div><!-- end row -->
    </div><!-- end container -->
    </section>

 @endif
    <!--======================================
            END SUBSCRIPTION AREA
    ======================================-->
@endsection

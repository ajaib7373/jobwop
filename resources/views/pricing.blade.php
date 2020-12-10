@extends('layouts.theme')

@section('content')


    <div class="pricing-section bg-white pb-5 pt-5">
        <div class="container">

            <div class="row">
                <div class="col-md-12">

                    <div class="pricing-section-heading mb-5 text-center">

                        <h1>Pricing</h1>
                        <h5 class="text-muted">Free Job Posting In Oromia</h5>
                    </div>

                </div>
            </div>


            <div class="row justify-content-center ">

                <div class="col-xs-12 col-md-6 ">

                    <div class="pricing-table-wrap bg-light pt-5 pb-5 text-center ">
                        <h1 class="display-4">0</h1>
                        <h3>Free</h3>

                        <div class="pricing-package-ribbon pricing-package-ribbon-light "></div>

                        <p class="mb-2 text-muted"> Advertise your job vacancies in</p>
                        <p class="mb-2 text-muted"> Oromia for free at Ethiopika.com</p>
                        <p class="mb-2 text-muted"> We do not charge you a penny for</p>
                        <p class="mb-2 text-muted"> posting jobs in Oromia. You can</p>
                        <p class="mb-2 text-muted"> advertise any number of vacancies</p>
                        <p class="mb-2 text-muted"> in Oromia for free here at</p>
                        <p class="mb-2 text-muted"> Ethiopika.com. Pay yourself,</p>
                        <p class="mb-2 text-muted"> the money you pay for advertising</p>
                        <p class="mb-2 text-muted"> jobs in Oromia!</p>

                        <a href="{{route('new_register')}}" class="btn btn-success mt-4"><i class="la la-user-plus"></i> Sign Up</a>
                    </div>
                </div>

                
            </div>


        </div>
    </div>


@endsection

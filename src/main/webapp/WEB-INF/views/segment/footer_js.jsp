<script src="${ctx}/res/js/jquery.min.js"></script>
<script src="${ctx}/res/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${ctx}/res/js/popper.min.js"></script>
<script src="${ctx}/res/js/bootstrap.min.js"></script>
<script src="${ctx}/res/js/jquery.easing.1.3.js"></script>
<script src="${ctx}/res/js/jquery.waypoints.min.js"></script>
<script src="${ctx}/res/js/jquery.stellar.min.js"></script>
<script src="${ctx}/res/js/owl.carousel.min.js"></script>
<script src="${ctx}/res/js/jquery.magnific-popup.min.js"></script>
<script src="${ctx}/res/js/aos.js"></script>
<script src="${ctx}/res/js/jquery.animateNumber.min.js"></script>
<script src="${ctx}/res/js/bootstrap-datepicker.js"></script>
<script src="${ctx}/res/js/jquery.timepicker.min.js"></script>
<script src="${ctx}/res/js/scrollax.min.js"></script>
<script src="${ctx}/res/js/main.js"></script>
<script src="${ctx}/res/js/custom.js"></script>

<%-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDmskGDn_xwyYOqP20KcXjQZ1ayIPwxn7g&sensor=false"></script>
<script src="${ctx}/res/js/google-map.js"></script> --%>

<script type="text/javascript">
    //forma esplicativa $(document).ready(function() {
    $(function () { //forma contratta
        $("aside .flags .flag-icon").click(function(){
            let lang = $(this).data("lang");
            window.location = (window.location.pathname + "?language=" + lang);
        });
       /* $("#locales").change(function () {
            var selectedOption = $('#locales').val();
            if (selectedOption != ''){
                window.location.replace('international?lang=' + selectedOption);
            }
        });
        */
    });
</script>

<script>
    'use strict';

    ;( function( $, window, document, undefined )
    {
        $( '.inputfile' ).each( function()
        {
            var $input	 = $( this ),
                $label	 = $input.next( 'label' ),
                labelVal = $label.html();

            $input.on( 'change', function( e )
            {
                var fileName = '';

                if( this.files && this.files.length > 1 )
                    fileName = ( this.getAttribute( 'data-multiple-caption' ) || '' ).replace( '{count}', this.files.length );
                else if( e.target.value )
                    fileName = e.target.value.split( '\\' ).pop();

                if( fileName )
                    $label.find( 'span' ).html( fileName );
                else
                    $label.html( labelVal );
            });

            // Firefox bug fix
            $input
                .on( 'focus', function(){ $input.addClass( 'has-focus' ); })
                .on( 'blur', function(){ $input.removeClass( 'has-focus' ); });
        });
    })( jQuery, window, document );
</script>



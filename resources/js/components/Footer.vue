<template>
    <!-- <footer>
        <div class="footer-content">
            <div class="row">
                <div class="col-8"><small>&copy; 2021 - Elixir Apps from Barj Lazuardi</small></div>
                <div class="col-4"><img src="/icons/mascot.png" class="img-fluid" alt="mascot.png"></div>
            </div>
            <div>
                <br>
            </div>
            <div class="base mt-3 mb-3" style="text-align: center;">
                <a style="cursor: pointer;">
                <img src="/icons/elixir.png" alt="" width="50" height="50">
                </a>
            </div>
            <div>
                <div class="text-center" style="color: #808080"><small>&copy; 2021 - Elixir Apps from Barj Lazuardi</small></div>
            </div>
        </div>
    </footer> -->
    <footer class="footer-page footer-20192" v-if="sambunganAuth.nomor_sambungan == null">
        <div class="site-section">
            <div class="container">
                <div class="cta d-block d-md-flex align-items-center px-5">
                    <div>
                        <h2 class="mb-0">Ready for a new membership?</h2>
                        <h3 class="text-dark">Let's get started!</h3>
                    </div>
                        <div class="ml-auto">
                        <a href="#" class="btn btn-dark rounded-0 py-3 px-5" v-bind:to="{name: 'Membership'}">Get For Membership</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm">
                        <a href="#" class="footer-logo brand-text" style="color: rgb(58, 207, 182);">Elixir</a>
                        <p class="copyright">
                        <small>© 2021</small>
                        </p>
                    </div>
                    <div class="col-sm">
                        <h3>Customers</h3>
                        <ul class="list-unstyled links">
                            <li><a href="#">Buyer</a></li>
                            <li><a href="#">Supplier</a></li>
                        </ul>
                    </div>
                    <div class="col-sm">
                        <h3>Company</h3>
                        <ul class="list-unstyled links">
                            <li><a href="#">About us</a></li>
                            <li><a href="#">Careers</a></li>
                            <li><a href="#">Contact us</a></li>
                        </ul>
                    </div>
                    <div class="col-sm">
                        <h3>Further Information</h3>
                        <ul class="list-unstyled links">
                            <li><a href="#">Terms &amp; Conditions</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3">
                        <h3>Follow us</h3>
                        <ul class="list-unstyled social">
                            <li><a href="#"><b-icon icon="facebook" font-scale="2" aria-hidden="true" variant="primary"></b-icon></a></li>
                            <li><a href="#"><b-icon icon="twitter" font-scale="2" aria-hidden="true" variant="primary"></b-icon></a></li>
                            <li><a href="#"><b-icon icon="linkedin" font-scale="2" aria-hidden="true" variant="info"></b-icon></a></li>
                            <li><a href="#"><b-icon icon="instagram" font-scale="2" aria-hidden="true" style="color: #E1306C"></b-icon></a></li>
                            <li><a href="#"><b-icon icon="youtube" font-scale="2" aria-hidden="true" variant="danger"></b-icon></a></li>
                        </ul>
                    </div>
                </div>      
            </div>
        </div>
    </footer>

    <footer class="footer-page footer-20192" v-else>
        <div class="site-section">
            <div class="container">
                <div class="cta d-block d-md-flex align-items-center px-5">
                    <div>
                    <h2 class="mb-0">Got a problem dude?</h2>
                    <h3 class="text-dark">Give some specific information</h3>
                    </div>
                        <div class="ml-auto">
                        <a href="#" class="btn btn-dark rounded-0 py-3 px-5">Contact us</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm">
                        <a href="#" class="footer-logo brand-text" style="color: rgb(58, 207, 182);">Elixir</a>
                        <p class="copyright">
                        <small>© 2021</small>
                        </p>
                    </div>
                    <div class="col-sm">
                        <h3>Customers</h3>
                        <ul class="list-unstyled links">
                            <li><a href="#">Buyer</a></li>
                            <li><a href="#">Supplier</a></li>
                        </ul>
                    </div>
                    <div class="col-sm">
                        <h3>Company</h3>
                        <ul class="list-unstyled links">
                            <li><a href="#">About us</a></li>
                            <li><a href="#">Careers</a></li>
                            <li><a href="#">Contact us</a></li>
                        </ul>
                    </div>
                    <div class="col-sm">
                        <h3>Further Information</h3>
                        <ul class="list-unstyled links">
                            <li><a href="#">Terms &amp; Conditions</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3">
                        <h3>Follow us</h3>
                        <ul class="list-unstyled social">
                            <li><a href="#"><b-icon icon="facebook" font-scale="2" aria-hidden="true" variant="primary"></b-icon></a></li>
                            <li><a href="#"><b-icon icon="twitter" font-scale="2" aria-hidden="true" variant="primary"></b-icon></a></li>
                            <li><a href="#"><b-icon icon="linkedin" font-scale="2" aria-hidden="true" variant="info"></b-icon></a></li>
                            <li><a href="#"><b-icon icon="instagram" font-scale="2" aria-hidden="true" style="color: #E1306C"></b-icon></a></li>
                            <li><a href="#"><b-icon icon="youtube" font-scale="2" aria-hidden="true" variant="danger"></b-icon></a></li>
                        </ul>
                    </div>
                </div>      
            </div>
        </div>
    </footer>

</template>

<script>
import {getHeader} from '../config.js'

export default {
    data() {
        return {
            sambunganAuth: {}
        }
    },
    mounted() {
        this.getSambungan()
    },
    methods: {
        getSambungan() {
            axios.get('/api/sambunganAuth', {headers: getHeader()})
            .then(response => {               
                this.sambunganAuth = response.data.data
            })
        },
    },
}
</script>

<style>
.footer-20192 {
    position: relative;
    color: #fff;
    padding: 7rem 0;
    background-color: #141d2a;
}
.footer-20192 .cta {
    -webkit-box-shadow: -20px -20px 0 0 rgb(52 58 64 / 20%);
    box-shadow: -20px -20px 0 0 rgb(52 58 64 / 20%);
    padding: 20px;
    background-color: #8186d5;
    top: -150px;
    position: relative;
}
.footer-20192 .footer-logo {
    color: #fff;
    font-size: 20px;
    text-transform: uppercase;
    letter-spacing: .1rem;
}
.footer-20192 .copyright {
    color: #666873;
}
.footer-20192 h3 {
    font-size: 16px;
    margin-bottom: 10px;
    margin-top: 0;
    line-height: 1.5;
}
.footer-20192 .links li {
    margin-bottom: 10px;
    line-height: 1.5;
    display: block;
}
.footer-20192 .links li a {
    color: #666873;
}
.list-unstyled {
    padding-left: 0;
    list-style: none;
}
.footer-20192 .social li {
    display: inline-block;
    position: relative;
}
.footer-20192 .social li a {
    position: relative;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    display: inline-block;
    text-align: center;
    margin: 0;
    padding: 0;
    padding-top: 6px;
    background-color: #5151536c;
    color: #fff;
}
.footer-20192 .social li a:hover {
    background-color: rgb(25, 78, 69);
}

</style>
<template>
    <div>
        <div class="card">
            <div class="card-header">Find Doctors</div>
            <div class="card-body">
                <Datepicker
                    class="my-datepicker"
                    calendar-class="my-datepicker_calendar"
                    :format="customDate"
                    :disabledDates="disabledDates"
                    v-model="time"
                    :inline="true"
                ></Datepicker>
            </div>
            <!-- {{ teachers }} -->
            <!-- {{time}} -->
            <div class="card mt-5">
                <div class="card-header">Doctors</div>
                <div class="card-body">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Photo</th>
                                <th>Name</th>
                                <th>Expertise</th>
                                <th>Booking</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(d, index) in teachers" :key="d.id">
                                <td>{{ index + 1 }}</td>
                                <td>
                                    <img
                                        :src="'/images/' + d.teacher.image"
                                        width="80"
                                    />
                                </td>
                                <td>{{ d.teacher.name }}</td>
                                <td>{{ d.teacher.department }}</td>
                                <td>
                                    <a
                                        :href="
                                            '/new-appointment/' +
                                            d.user_id +
                                            '/' +
                                            d.date
                                        "
                                        ><button class="btn btn-success">
                                            Book Appointment
                                        </button></a
                                    >
                                </td>
                            </tr>
                            <td v-if="teachers.length == 0">
                                No Teachers available for {{ this.time }}
                            </td>
                        </tbody>
                    </table>
                    <div class="text-center">
                        <pulse-loader
                            :loading="loading"
                            :color="color"
                            :size="size"
                        ></pulse-loader>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Datepicker from "vuejs-datepicker";
import moment from "moment";
import PulseLoader from "vue-spinner/src/PulseLoader.vue";
export default {
    components: {
        Datepicker,
        PulseLoader,
        moment
    },
    data() {
        return {
            time:'',
            loading: false,
            teachers: [],
            disabledDates: {
                to: new Date(Date.now() - 86400000),
            },
        };
    },
    methods: {
        customDate(date) {
            this.loading = true;
            this.time = moment(date).format("YYYY-MM-DD");
            axios
                .post("/api/find-teachers", { date: this.time })
                .then((response) => {
                    setTimeout(() => {
                        this.teachers = response.data;
                    }, 1000);
                    this.loading = false;
                })
                .catch((error) => {
                    alert("error");
                });
        },
    },
    mounted() { 
        this.loading = true;
        axios.get("/api/teachers/today").then((response) => {
            this.teachers = response.data;
            // console.log(response.data);
            this.loading = false;
        });
    },
};
</script>

<style scoped>
.my-datepicker >>> .my-datepicker_calendar {
    width: 100%;
    height: 330px;
    font-weight: bold;
}
</style>

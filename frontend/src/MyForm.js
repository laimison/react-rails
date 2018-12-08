import React from "react";
import { Formik } from "formik";
import * as Yup from "yup";
import axios from "axios";
import qs from 'qs';

// Inspired by https://medium.com/dailyjs/why-build-your-forms-with-redux-form-bcacbedc9e8 about forms, also by https://blog.stvmlbrn.com/2017/04/07/submitting-form-data-with-react.html about the states
const MyForm = () => (
  <div className="app">

    <h1>Email Form Using Formik</h1>

    <Formik
      initialValues={{ email: "", message: "" }}
      onSubmit={(values, { setSubmitting }) => {
        setTimeout(() => {
          // Solution to use qs.stringify for posting json - https://github.com/axios/axios/issues/1440 by JustinBeckwith - without this extra unwanted characters of \ or \n added
          axios.post("http://localhost:5000/v1/examples", qs.stringify(values)).then(result => {

          });

          alert('Confirm this, so email will be sent to us. Thank you!');

          setSubmitting(false);
        }, 500);
      }}
      validationSchema={Yup.object().shape({
        email: Yup.string()
          .email()
          .required("Email is required")
      })}
    >

      {props => {
        const {
          values,
          touched,
          errors,
          dirty,
          isSubmitting,
          handleChange,
          handleBlur,
          handleSubmit,
          handleReset
        } = props;

        return (
          <form onSubmit={handleSubmit}>
            <label htmlFor="email" style={{ display: "block" }}>
              Email
            </label>
            <input
              id="email"
              placeholder="Enter your email"
              type="text"
              value={values.email}
              onChange={handleChange}
              onBlur={handleBlur}
              className={
                errors.email && touched.email
                  ? "text-input error"
                  : "text-input"
              }
            />

            <input
              id="message"
              placeholder="Enter your message"
              type="text"
              value={values.message}
              onChange={handleChange}
              onBlur={handleBlur}
            />

            {errors.email && touched.email && (
              <div className="input-feedback">{errors.email}</div>
            )}

            <button
              type="button"
              className="outline"
              onClick={handleReset}
              disabled={!dirty || isSubmitting}
            >
              Reset
            </button>
            <button type="submit" disabled={isSubmitting}>
              Submit
            </button>

          </form>
        );

      }}

    </Formik>

  </div>
);

export default MyForm;

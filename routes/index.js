const express = require('express')
const actions = require('../methods/actions')
const router = express.Router()

const {
    userAuth,
    userLogin,
    checkRole,
    userRegister,
    serializeUser
  } = require("../utils/Auth");


router.get('/', (req, res) => {
    res.send('Hello World')
})

router.get('/dashboard', (req, res) => {
    res.send('Dashboard')
})

router.post("/register-student", async (req, res) => {
    await userRegister(req.body, "student", res);
  });
  
  // Volunteer Registration Route
  router.post("/register-volunteer", async (req, res) => {
    await userRegister(req.body, "volunteer", res);
  });
  
  // Admin Registration Route
  router.post("/register-admin", async (req, res) => {
    await userRegister(req.body, "admin", res);
  });

  // student Login Route
router.post("/login-student", async (req, res) => {
    await userLogin(req.body, "student", res);
  });
  
  // Admin Login Route
  router.post("/login-admin", async (req, res) => {
    await userLogin(req.body, "admin", res);
  });
  
  // volunteer Login Route
  router.post("/login-volunteer", async (req, res) => {
    await userLogin(req.body, "volunteer", res);
  });

  // Profile Route
    router.get("/profile", userAuth, async (req, res) => {
    return res.json(serializeUser(req.user));
  });
  
  // student Protected Route
router.get(
    "/student-protected",
    userAuth,
    checkRole(["student"]),
    async (req, res) => {
      return res.json("Hello student");
    }
  );
  
  // Admin Protected Route
  router.get(
    "/admin-protected",
    userAuth,
    checkRole(["admin"]),
    async (req, res) => {
      return res.json("Hello Admin");
    }
  );
  
  // volunteer Protected Route
  router.get(
    "/volunteer-protectd",
    userAuth,
    checkRole(["volunteer"]),
    async (req, res) => {
      return res.json("Hello volunteer");
    }
  );
  
  // volunteer and admin Protected Route
  router.get(
    "/volunteer-and-admin-protectd",
    userAuth,
    checkRole(["volunteer", "admin"]),
    async (req, res) => {
      return res.json("volunteer and Admin");
    }
  );
  

//@desc Get info on a user
//@route GET /getinfo
router.get('/getinfo', actions.getinfo)



module.exports = router
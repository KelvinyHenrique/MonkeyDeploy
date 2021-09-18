import express from 'express';
import SSH from '../controllers/SshController';

const router = express.Router();

router.post('/command', SSH.test);

module.exports = router;

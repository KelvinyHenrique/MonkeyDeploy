import express from 'express';
import SshController from '../controllers/SshController';

const router = express.Router();

router.post('/command', SshController.command);

module.exports = router;

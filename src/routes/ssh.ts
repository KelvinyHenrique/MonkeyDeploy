import express from 'express';
import SshController from '../Controllers/SshController';

const router = express.Router();

router.post('/command', SshController.command);

module.exports = router;

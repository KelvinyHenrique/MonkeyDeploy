import express from 'express';
import HookController from '../controllers/HookController';

const router = express.Router();

router.post('/github/send', HookController.github);

module.exports = router;

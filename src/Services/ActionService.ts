import SshService from './ssh/SshService';

export default class ActionService {
  ssh: any;

  constructor() {
    this.ssh = new SshService(
      process.env.SSH_HOST,
      process.env.SSH_PORT,
      process.env.SSH_USER,
      process.env.SSH_PRIVATE_KEY,
    );
  }

  async pull() {
    try {
      const response = this.ssh.command({
        command:
          'git stash && git pull && cp ./config/alpha.env.js ./config/prod.env.js && ./build.run ',
        directory: '/containers/DPCEcommerce/',
      });
      return response;
    } catch (error) {
      console.log(error);
      return { error: 1, fullError: error };
    }
  }
}

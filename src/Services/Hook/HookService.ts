export default class HookService {
  data: any;

  eventType: string;

  githubEvent: any;

  parsedData: any;

  constructor() {
    this.data = {};
    this.githubEvent = {};
    this.parsedData = {};
    this.eventType = '';
  }

  github(event: any) {
    this.githubEvent = event;
    try {
      if (this.githubEvent) {
        console.log(this.githubEvent);
      } else {
        console.log('Hoje não');
      }
      return { hello: 'hello' };
    } catch (error) {
      return { error: 1, fullError: error };
    }
  }
}

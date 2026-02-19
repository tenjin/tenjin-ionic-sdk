import { Component } from '@angular/core';
import { Tenjin } from 'ionic-capacitor-tenjin';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
  standalone: false,
})
export class HomePage {

  constructor() {}

  async initTenjin() {
    await Tenjin.initialize({ sdkKey: '' })
  }

  async connectTenjin() {
    await Tenjin.connect()
  }

  async optIn() {
    await Tenjin.optIn()
  }

  async optOut() {
    await Tenjin.optOut()
  }

  async sendEvent() {
    await Tenjin.eventWithName({ name: "Event" })
  }

  async updatePostback() {
    await Tenjin.updatePostbackConversionValueCoarseValueLockWindow({ conversionValue: 2, coarseValue: "medium", lockWindow: true })
  }

  async setCustomerUserId() {
    await Tenjin.setCustomerUserId({ userId: "test_ionic_user_id" })
  }

  async getCustomerUserId() {
    let userId = await Tenjin.getCustomerUserId()
    console.log(userId)
  }

  async attributionInfo() {
    let attributionInfo = await Tenjin.getAttributionInfo()
    console.log(attributionInfo)
  }

  async sendImpression() {
    await Tenjin.eventAdImpressionAppLovin({ json: {
      "format": "Banner",
      "revenue_precision": "exact",
      "ad_unit_id": "12345680",
      "network_placement": "banner_regular",
      "placement": "",
      "publisher_revenue_decimal": "0",
      "ad_revenue_currency": "USD",
      "revenue": "0",
      "creative_id": "6146419",
      "publisher_revenue_micro": "0",
      "network_name": "AppLovin"
    }})
  }

  async getUserProfile() {
    const profile = await Tenjin.getUserProfileDictionary();
    console.log('===> User Profile Data:');
    Object.entries(profile).forEach(([key, value]) => {
      console.log(`===> ${key}: ${value}`);
    });
  }

  async resetUserProfile() {
    await Tenjin.resetUserProfile();
    console.log('===> User Profile has been reset');
  }
}
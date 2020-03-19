require 'spec_helper'

describe 'Home Spec', js: true do
  before(:each) do
    visit('/')
  end

  describe "MainHeader" do
    it "Shows Aditya DP Image" do
      expect(page).to have_selector('img[alt="cdadityang DP Header"]')
      expect(page).to have_selector('img[src="./assets/cdadityang-welcome-180x180.png"]')
    end
    
    it "shows My Full Name H1" do
      expect(page).to have_selector('h1', text: 'Aditya Nagla')
    end

    it "shows my usertag p" do
      expect(page).to have_selector('p', text: '@cdadityang')
    end

    it "shows my short description" do
      expect(page).to have_selector('p', text: /I'm into full-stack web development and a blockchain newbie./)
    end
  end

  describe "MainSection" do
    it "shows a little info" do
      expect(page).to have_selector('p', text: /Holla there, welcome to my official website./)
    end

    context "shows navigation links in form of buttons" do
      it "shows Drabkirn link" do
        expect(page).to have_link('Drabkirn', href: 'https://drabkirn.cdadityang.xyz')
      end
    end
  end

  describe "Social Text and Links" do
    it "shows social CTA text" do
      expect(page).to have_selector('p', text: /I do maintain and write about tech in general on my blog./)
    end

    it "shows blog link" do
      expect(page).to have_link('', href: 'https://blog.cdadityang.xyz')
    end

    it "shows github link" do
      expect(page).to have_link('', href: 'https://github.com/cdadityang')
    end

    it "shows twitter link" do
      expect(page).to have_link('', href: 'https://twitter.com/cdadityang')
    end

    it "shows LinkedIn link" do
      expect(page).to have_link('', href: 'https://www.linkedin.com/in/cdadityang')
    end

    it "shows stackoverflow link" do
      expect(page).to have_link('', href: 'https://stackoverflow.com/users/12543970/cdadityang')
    end
  end

  describe "Footer" do
    it "shows copyrights info" do
      expect(page).to have_selector('footer .footer-legal p', text: "Copyrights ©, 2019-2020 - cdadityang")
    end

    it "Copyrights cdadityang must be clickable to /" do
      expect(page).to have_link('cdadityang', href: '/')
    end

    it "shows Palace link" do
      expect(page).to have_link('Palace', href: 'https://drabkirn.cdadityang.xyz/palace')
    end

    it "shows Contact link" do
      expect(page).to have_link('Contact', href: 'mailto:me@cdadityang.xyz')
    end

    it "Shows Baaaaaa text" do
      expect(page).to have_selector('footer .footer-baaaaaa p', text: "@Baaaaaa")
    end
  end
end
#! /usr/bin/env ruby
require 'spec_helper'

describe 'base::linux' do
  it { is_expected.to contain_class('base::linux') }

  it do

   is_expected.to contain_file('/root/.vimrc').with({
      'ensure' => 'present',
      'owner'  => 'root',
      'mode'   => '0655',
    })

  end
end

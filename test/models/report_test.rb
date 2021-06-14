# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable_user' do
    alice = users('alice')
    alice_report = reports('alice_report')
    assert alice_report.editable?(alice)

    bob = users('bob')
    assert_not alice_report.editable?(bob)
  end

  test '#created_on' do
    alice_report = reports('alice_report')
    assert_equal Time.zone.today, alice_report.created_on
  end
end

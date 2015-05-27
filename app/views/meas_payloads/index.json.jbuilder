json.array!(@meas_payloads) do |meas_payload|
  json.extract! meas_payload, :id, :site, :name, :value
  json.url meas_payload_url(meas_payload, format: :json)
end

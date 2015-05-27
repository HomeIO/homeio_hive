class MeasPayload < ActiveRecord::Base
  def to_curl_command
    data = {meas_payload: {name: self.name, site: self.site, value: self.value}}
    command = "curl -X PUT -d \"#{data.to_query}\" \"http://localhost:3000/meas_payloads/announce.json\""

    `#{command}`

    return command

  end
end

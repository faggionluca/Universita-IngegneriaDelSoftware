package com.lucafaggion
import com.lucafaggion.auth.*

class ShippingInfo {
    int number
    String address
    String state
    int postalzone
    static belongsTo = [user:User]
    static constraints = {
    }
}
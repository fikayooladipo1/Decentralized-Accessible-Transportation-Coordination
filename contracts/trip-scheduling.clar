;; Trip Scheduling Contract
;; Coordinates shared rides and optimizes routes

(define-data-var last-id uint u0)

(define-map trips
  { id: uint }
  {
    rider: principal,
    vehicle-id: uint,
    pickup: (string-ascii 100),
    destination: (string-ascii 100),
    status: (string-ascii 20)
  }
)

;; Schedule trip
(define-public (schedule
    (vehicle-id uint)
    (pickup (string-ascii 100))
    (destination (string-ascii 100))
  )
  (let
    (
      (new-id (+ (var-get last-id) u1))
    )
    (var-set last-id new-id)

    (map-set trips
      { id: new-id }
      {
        rider: tx-sender,
        vehicle-id: vehicle-id,
        pickup: pickup,
        destination: destination,
        status: "scheduled"
      }
    )

    (ok new-id)
  )
)

;; Update status
(define-public (update-status
    (trip-id uint)
    (status (string-ascii 20))
  )
  (let
    (
      (trip (unwrap! (map-get? trips { id: trip-id }) (err u404)))
    )
    (map-set trips
      { id: trip-id }
      (merge trip { status: status })
    )

    (ok true)
  )
)

;; Get trip
(define-read-only (get-trip (id uint))
  (map-get? trips { id: id })
)

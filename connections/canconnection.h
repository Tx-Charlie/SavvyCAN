#ifndef CANCONNECTION_H
#define CANCONNECTION_H

#include <Qt>
#include <QObject>
#include "utils/lfqueue.h"
#include "can_structs.h"
#include "canbus.h"
#include "canconconst.h"

struct BusData;

class CANConnection : public QObject
{
    Q_OBJECT

protected:

    /**
     * @brief CANConnection constructor
     * @param pPort: string containing port name
     * @param pType: the type of connection @ref CANCon::type
     * @param pNumBuses: the number of buses the device has
     * @param pQueueLen: the length of the lock free queue to use
     * @param pUseThread: if set to true, object will be execute in a dedicated thread
     */
    CANConnection(QString pPort,
                  CANCon::type pType,
                  int pNumBuses,
                  int pQueueLen,
                  bool pUseThread);

public:

    /**
     * @brief CANConnection destructor
     */

    virtual ~CANConnection();

    /**
     * @brief getNumBuses
     * @return returns the number of buses of the device
     */
    int getNumBuses() const;

    /**
     * @brief getPort
     * @return returns the port name of the device
     */
    QString getPort();

    /**
     * @brief getQueue
     * @return the lock free queue of the device
     */
    LFQueue<CANFrame>& getQueue();

    /**
     * @brief getType
     * @return the @ref CANCon::type of the device
     */
    CANCon::type getType();

    /**
     * @brief getStatus
     * @return the @ref CANCon::status of the device (either connected or not)
     */
    CANCon::status getStatus();


signals:
    /*not implemented yet */
    void error(const QString &);
    void deviceInfo(int, int); //First param = driver version (or version of whatever you want), second param a status byte

    //bus number, bus speed, status (bit 0 = enabled, 1 = single wire, 2 = listen only)
    //3 = Use value stored for enabled, 4 = use value passed for single wire, 5 = use value passed for listen only
    //6 = use value passed for speed. This allows bus status to be updated but set that some things aren't really
    //being passed. Just set for things that really are being updated.
    void busStatus(int, int, int);

    /**
     * @brief event sent when a frame matching a filter is received
     */
    void targettedFrameReceived(CANFrame frame);

    /**
     * @brief event emitted when the CANCon::status of the connection changes (connected->not_connected or the other way round)
     * @param pStatus: the new status of the device
     */
    void status(CANCon::status pStatus);


public slots:

    /**
     * @brief start the device. This calls piStarted
     * @note starts the working thread if required (piStarted is called in the working thread context)
     */
    void start();

    /**
     * @brief stop the device. This calls piStop
     * @note if a working thread is used, piStop is called before exiting the working thread
     */
    void stop();

    /**
     * @brief setBusSettings
     * @param pBusIdx: the index of the bus for which settings have to be set
     * @param pBus: the settings to set
     * @note this calls piSetBusSettings in the working thread context (if one has been started)
     */
    void setBusSettings(int pBusIdx, CANBus pBus);

    /**
     * @brief getBusSettings
     * @param pBusIdx: the index of the bus for which settings have to be retrieved
     * @param pBus: the CANBus struct to fill with information
     * @return true if operation succeeds, false if pBusIdx is invalid or bus has not been configured yet
     * @note this calls piGetBusSettings in the working thread context (if one has been started)
     */
    bool getBusSettings(int pBusIdx, CANBus& pBus);

    /**
     * @brief suspends/restarts data capture
     * @param pSuspend: suspends capture if true else restarts it
     * @note this calls piSuspend (in the working thread context if one has been started)
     * @note the caller shall not access the queue when capture is suspended,
     * @note the callee is expected to flush the queue
     */
    void suspend(bool pSuspend);

    /**
     * @brief provides device with the frame to send
     * @param pFrame: the frame to send
     * @return false if parameter is invalid (bus id for instance)
     * @note this calls piSendFrame (in the working thread context if one has been started)
     */
    bool sendFrame(const CANFrame& pFrame);

    /**
     * @brief provides device with a list of frames to send
     * @param pFrame: the list of frames to send
     * @return false if parameter is invalid (bus id for instance)
     * @note this calls piSendFrameBatch (in the working thread context if one has been started)
     */
    bool sendFrames(const QList<CANFrame>& pFrames);

    /**
     * @brief Add a new filter for the targetted frames. If a frame matches it will immediately be sent via the targettedFrameReceived signal
     * @param pBusId - Which bus to bond to. -1 for any, otherwise a bitfield of buses (but 0 = first bus, etc)
     * @param target - The filter to use for selected targetted frames
     * @return true if filter was able to be added, false otherwise.
     */
    bool addTargettedFrame(int pBusId, const CANFlt &target);

    /**
     * @brief Try to find a matching filter in the list and remove it, no longer targetting those frames
     * @param pBusId - Which bus to bond to. Doesn't have to match the call to addTargettedFrame exactly. You could disconnect just one bus for instance.
     * @param target - The filter that was set
     * @return true if filter was found and deleted, false otherwise.
     */
    bool removeTargettedFrame(int pBusId, const CANFlt &target);

protected:

    //determine if the passed frame is part of a filter or not.
    void checkTargettedFrame(CANFrame &frame);

    /**
     * @brief setStatus
     * @param pStatus: the status to set
     */
    void setStatus(CANCon::status pStatus);

    /**
     * @brief isConfigured
     * @param pBusId
     * @return true if bus is configured
     */
    bool isConfigured(int pBusId);

    /**
     * @brief setConfigured
     * @param pBusId
     * @param pConfigured
     * @note it is not necessary to call this function to set pBusId configured, it is enough to call @ref setBusConfig
     */
    void setConfigured(int pBusId, bool pConfigured);

    /**
     * @brief getBusConfig
     * @param pBusId
     * @param pBus
     * @return true if operation succeeds, false if pBusIdx is invalid or bus has not been configured yet
     */
    bool getBusConfig(int pBusId, CANBus& pBus);

    /**
     * @brief setBusConfig
     * @param pBusId: the index of the bus for which settings have to be set
     * @param pBus: the settings to set
     */
    void setBusConfig(int pBusId, CANBus& pBus);

    /**
     * @brief isCapSuspended
     * @return true if the capture is suspended
     */
    bool isCapSuspended();

    /**
     * @brief setCapSuspended
     * @param pIsSuspended
     */
    void setCapSuspended(bool pIsSuspended);

protected:

    /**************************************************************/
    /***********     protected interface to implement       *******/
    /**************************************************************/

    /**
     * @brief starts the device
     */
    virtual void piStarted() = 0;

    /**
     * @brief stops the device
     */
    virtual void piStop() = 0;

    /**
     * @brief piSetBusSettings
     * @param pBusIdx: the index of the bus for which settings have to be set
     * @param pBus: the settings to set
     */
    virtual void piSetBusSettings(int pBusIdx, CANBus pBus) = 0;

    /**
     * @brief piGetBusSettings
     * @param pBusIdx: the index of the bus for which settings have to be retrieved
     * @param pBus: the CANBus struct to fill with information
     * @return true if operation succeeds, false if pBusIdx is invalid or bus has not been configured yet
     */
    virtual bool piGetBusSettings(int pBusIdx, CANBus& pBus) = 0;

    /**
     * @brief suspends/restarts data capture
     * @param pSuspend: suspends capture if true else restarts it
     * @note the caller will not access the queue when capture is suspended, so it is safe for callee to flush the queue
     */
    virtual void piSuspend(bool pSuspend) = 0;

    /**
     * @brief provides device with the frame to send
     * @param pFrame: the frame to send
     * @return false if parameter is invalid (bus id for instance)
     */
    virtual bool piSendFrame(const CANFrame&) = 0;

    /**
     * @brief provides device with a list of frames to send
     * @param pFrame: the list of frames to send
     * @return false if parameter is invalid (bus id for instance)
     * @note implementing this function is optional
     */
    virtual bool piSendFrames(const QList<CANFrame>&);

private:
    LFQueue<CANFrame>   mQueue;
    const int           mNumBuses;
    const QString       mPort;
    const CANCon::type  mType;
    bool                mIsCapSuspended;
    QAtomicInt          mStatus;
    bool                mStarted;
    BusData*            mBusData_p;
    QThread*            mThread_p;
};

#endif // CANCONNECTION_H